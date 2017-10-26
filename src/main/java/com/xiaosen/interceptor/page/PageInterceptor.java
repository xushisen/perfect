package com.xiaosen.interceptor.page;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.resultset.ResultSetHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.apache.ibatis.scripting.defaults.DefaultParameterHandler;
import org.apache.ibatis.session.RowBounds;

/**
 * 
 * 类描述： 分页，求总数sql拦截 创建人：ssxu 创建时间：2017-6-24 下午1:53:47
 * 
 * @version 1.0
 * 
 */
@Intercepts({
		@Signature(type = StatementHandler.class, method = "prepare", args = { Connection.class }),
		@Signature(type = ResultSetHandler.class, method = "handleResultSets", args = { Statement.class }) })
public class PageInterceptor implements Interceptor {
	private static final String SELECT_ID = "getList";

	// 插件运行的代码，它将代替原有的方法
	@Override
	@SuppressWarnings("unchecked")
	public Object intercept(Invocation invocation) throws Throwable {
		if (invocation.getTarget() instanceof StatementHandler) {
			StatementHandler statementHandler = (StatementHandler) invocation
					.getTarget();
			MetaObject metaStatementHandler = SystemMetaObject
					.forObject(statementHandler);
			MappedStatement mappedStatement = (MappedStatement) metaStatementHandler
					.getValue("delegate.mappedStatement");
			String selectId = mappedStatement.getId();

			if (SELECT_ID
					.equals(selectId.substring(selectId.lastIndexOf(".") + 1))) {
				BoundSql boundSql = (BoundSql) metaStatementHandler
						.getValue("delegate.boundSql");
				// 分页参数作为参数对象parameterObject的一个属性
				String sql = boundSql.getSql();
				Map<String, Object> pageMap = (Map<String, Object>) (boundSql
						.getParameterObject());
				// 重写sql
				String countSql = concatCountSql(sql);
				String pageSql = concatPageSql(sql, pageMap);

				Connection connection = (Connection) invocation.getArgs()[0];
				
				//通过BoundSql获取对应的参数映射
			    List<ParameterMapping> parameterMappings = boundSql.getParameterMappings();
			    //利用Configuration、查询记录数的Sql语句countSql、参数映射关系parameterMappings和参数对象page建立查询记录数对应的BoundSql对象。
			    BoundSql countBoundSql = new BoundSql(mappedStatement.getConfiguration(), countSql, parameterMappings, pageMap);
				//通过mappedStatement、参数对象page和BoundSql对象countBoundSql建立一个用于设定参数的ParameterHandler对象
			    ParameterHandler parameterHandler = new DefaultParameterHandler(mappedStatement, pageMap, countBoundSql);
				PreparedStatement countStmt = null;
				ResultSet rs = null;
				int totalCount = 0;
				try {
					countStmt = connection.prepareStatement(countSql);
					//通过parameterHandler给PreparedStatement对象设置参数
					parameterHandler.setParameters(countStmt);
					rs = countStmt.executeQuery();
					if (rs.next()) {
						totalCount = rs.getInt(1);
					}
				} catch (SQLException e) {
					System.out.println("Ignore this exception" + e);
				} finally {
					try {
						rs.close();
						countStmt.close();
					} catch (SQLException e) {
						System.out.println("Ignore this exception" + e);
					}
				}

				metaStatementHandler.setValue("delegate.boundSql.sql", pageSql);
				// 采用物理分页后，就不需要mybatis的内存分页了，所以重置下面的两个参数
		        metaStatementHandler.setValue("delegate.rowBounds.offset", RowBounds.NO_ROW_OFFSET);
		        metaStatementHandler.setValue("delegate.rowBounds.limit", RowBounds.NO_ROW_LIMIT);
				// 绑定count
				pageMap.put("count", totalCount);
			}
		}

		return invocation.proceed();
	}

	/**
	 * 拦截类型StatementHandler
	 */
	@Override
	public Object plugin(Object target) {
		if (target instanceof StatementHandler) {
			return Plugin.wrap(target, this);
		} else {
			return target;
		}
	}

	@Override
	public void setProperties(Properties properties) {

	}

	public String concatCountSql(String sql) {
		StringBuffer sb = new StringBuffer("SELECT COUNT(*) FROM ");
		// sql = sql.toLowerCase();

		if (sql.lastIndexOf("order") > sql.lastIndexOf(")")) {
			sb.append(sql.substring(sql.indexOf("FROM") + 4,
					sql.lastIndexOf("order")));
		} else {
			sb.append(sql.substring(sql.indexOf("FROM") + 4));
		}
		return sb.toString();
	}

	public String concatPageSql(String sql, Map<String, Object> pageMap) {
		StringBuffer sb = new StringBuffer();
		sb.append(sql);
		int pagesize = Integer.parseInt(pageMap.get("pagesize").toString());
		int pagebegin = (Integer.parseInt(pageMap.get("pagebegin").toString()) - 1) * pagesize;
		sb.append(" LIMIT ").append(pagebegin).append(",").append(pagesize);
		return sb.toString();
	}
}

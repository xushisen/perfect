package com.xiaosen.util.dashuju;

/**import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;*/

//import org.hibernate.Session;

//import com.zayun.model.Groups;

public class Insert {
	
	/**
	 * 这个方法插入主要是用到PreparedStatement.addBatch() 这个方法  速度超快
	 * @throws Exception
	 */
	public void saveGroups(/**List<Groups> groupsList*/) throws Exception {
		/**String sql = "INSERT INTO smd_groups(id,school,xq,ksxs,classes,rkls,xh,xm,fsdj,yx,sx,yy,wl,hx,dl,sw,ls,sp,type,create_date) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		Connection conn = session.connection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		conn.setAutoCommit(false);
		int size = groupsList.size();
		for (int i = 0; i < size; i++) {
			Groups groups = groupsList.get(i);
			stmt.setString(1, UUID.randomUUID().toString().replace("-", ""));
			stmt.setString(2, groups.getSchool());
			stmt.setString(3, groups.getXq());
			stmt.setString(4, groups.getKsxs());
			stmt.setString(5, groups.getClasses());
			stmt.setString(6, groups.getRkls());
			stmt.setString(7, groups.getXh());
			stmt.setString(8, groups.getXm());
			stmt.setString(9, groups.getFsdj());
			stmt.setString(10, groups.getYx());
			stmt.setString(11, groups.getSx());
			stmt.setString(12, groups.getYy());
			stmt.setString(13, groups.getWl());
			stmt.setString(14, groups.getHx());
			stmt.setString(15, groups.getDl());
			stmt.setString(16, groups.getSw());
			stmt.setString(17, groups.getLs());
			stmt.setString(18, groups.getSp());
			stmt.setString(19, "1");
			stmt.setTimestamp(20, new Timestamp(new java.util.Date().getTime()));
			stmt.addBatch();
			if (i%100==0){
				stmt.executeBatch();
			    conn.commit();
			    stmt.clearBatch();
			}
		}
		stmt.executeBatch();
	    conn.commit();
	    stmt.clearBatch();
	    
		stmt.close();
		conn.close();
		session.close();*/
	}
}

package com.xiaosen.util.auto;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;

import com.xiaosen.util.date.DateUtils;
import com.xiaosen.util.file.FileUtils;
import com.xiaosen.util.string.StringUtils;

/**
 * 类描述：java开发自动生成action,service,serviceImpl,dao,daoImpl,jtml,entity,js等
 *   
 * 创建人：ssxu  
 * 创建时间：2017-1-8 上午11:13:06   
 * 版本 1.0.0
 *
 */
public class autoCreateClass {

	//需要改的地方  S
	//注释 作者
	public static String author = "徐石森";
	//注释 创建时间
	public static String date =DateUtils.getNowDate();
	//注释  描述信息
	public static String descritpion = "描述";
	
	//模块名称  ---------- ----------
	public static String model = "work";
	//功能模块  ---------- ----------
	public static String entityClass = "Work";
	//实体类的变量名称  ---------- ----------
	public static String lowerEntity = "work";
	//表名  ---------- ----------
	public static String tableName = "edu_work";
	//需要改的地方  E
	
	//引入的包的路径
	//生成controller包结构
	public static String controllerPackage = "com.xiaosen.controller."+model;
	//生成service包结构
	public static String servicePackage = "com.xiaosen.service."+model;
	//生成serviceImpl结构
	public static String serviceImplPackage = "com.xiaosen.service.impl."+model;
	//生成entity结构
	public static String eitityPackage = "com.xiaosen.entity."+model;
	//生成dao结构
	public static String daoPackage = "com.xiaosen.dao."+model;
	
	//生成类存放的路径
	//生成controller包结构
	public static String controllerPackageSt = "src/main/java/com/xiaosen/controller/"+model;
	//生成service包结构
	public static String servicePackageSt = "src/main/java/com/xiaosen/service/"+model;
	//生成serviceImpl结构
	public static String serviceImplPackageSt = "src/main/java/com/xiaosen/service/impl/"+model;
	//生成dao结构
	public static String daoPackageSt = "src/main/java/com/xiaosen/dao/"+model;
	//生成entity结构
	public static String entityPackageSt = "src/main/java/com/xiaosen/entity/"+model;
	//生成xml结构
	public static String xmlPackageSt = "src/main/java/com/xiaosen/mapper/"+model;
	//list.jsp结构
	public static String listPackageSt = "src/main/webapp/WEB-INF/view/"+model;
	
	/**
	 * 创建controller(通过一个模板 生成一个实体类)  创建其他的都一样了
	 */
	public static void createControllerClass() throws Exception{
		String newClassName = getHomeDir(controllerPackageSt)+entityClass+"Controller.java";
		//获取对应的模板
		String templateContent = FileUtils.reanFile(getHomeDir("src/main/java/com/xiaosen/temp")+"controller.txt");
		//判断目录是否存在 不存在就创建
		new File(newClassName).getParentFile().mkdirs();
		if (!FileUtils.isExist(newClassName)) {
			buildClass(templateContent,newClassName,eitityPackage);
			System.out.println("[创建实体类]"+newClassName+"成功了!!!!!");
		} else {
			System.err.println("实体类已经存在是否覆盖?  y覆盖");
			BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
			String line = reader.readLine();
			if (null != line && line.equalsIgnoreCase("y")) {
				buildClass(templateContent,newClassName,eitityPackage);
				System.out.println("[覆盖实体类]"+newClassName+"成功了!!!!!");
			}
		}
	}
	
	/**
	 * service 创建
	 * @throws Exception
	 */
	public static void createServiceClass() throws Exception{
		String newClassName = getHomeDir(servicePackageSt)+entityClass+"Service.java";
		//获取对应的模板
		String templateContent = FileUtils.reanFile(getHomeDir("src/main/java/com/xiaosen/temp")+"service.txt");
		//判断目录是否存在 不存在就创建
		new File(newClassName).getParentFile().mkdirs();
		if (!FileUtils.isExist(newClassName)) {
			buildClass(templateContent,newClassName,eitityPackage);
			System.out.println("[创建实体类]"+newClassName+"成功了!!!!!");
		} else {
			System.err.println("实体类已经存在是否覆盖?  y覆盖");
			BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
			String line = reader.readLine();
			if (null != line && line.equalsIgnoreCase("y")) {
				buildClass(templateContent,newClassName,eitityPackage);
				System.out.println("[覆盖实体类]"+newClassName+"成功了!!!!!");
			}
		}
	}
	
	/**
	 * serviceImpl 创建
	 * @throws Exception
	 */
	public static void createServiceImplClass() throws Exception{
		String newClassName = getHomeDir(serviceImplPackageSt)+entityClass+"ServiceImpl.java";
		//获取对应的模板
		String templateContent = FileUtils.reanFile(getHomeDir("src/main/java/com/xiaosen/temp")+"serviceImpl.txt");
		//判断目录是否存在 不存在就创建
		new File(newClassName).getParentFile().mkdirs();
		if (!FileUtils.isExist(newClassName)) {
			buildClass(templateContent,newClassName,eitityPackage);
			System.out.println("[创建实体类]"+newClassName+"成功了!!!!!");
		} else {
			System.err.println("实体类已经存在是否覆盖?  y覆盖");
			BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
			String line = reader.readLine();
			if (null != line && line.equalsIgnoreCase("y")) {
				buildClass(templateContent,newClassName,eitityPackage);
				System.out.println("[覆盖实体类]"+newClassName+"成功了!!!!!");
			}
		}
	}
	
	/**
	 * dao创建
	 * @throws Exception
	 */
	public static void createDaoClass() throws Exception{
		String newClassName = getHomeDir(daoPackageSt)+entityClass+"Dao.java";
		//获取对应的模板
		String templateContent = FileUtils.reanFile(getHomeDir("src/main/java/com/xiaosen/temp")+"dao.txt");
		//判断目录是否存在 不存在就创建
		new File(newClassName).getParentFile().mkdirs();
		if (!FileUtils.isExist(newClassName)) {
			buildClass(templateContent,newClassName,eitityPackage);
			System.out.println("[创建实体类]"+newClassName+"成功了!!!!!");
		} else {
			System.err.println("实体类已经存在是否覆盖?  y覆盖");
			BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
			String line = reader.readLine();
			if (null != line && line.equalsIgnoreCase("y")) {
				buildClass(templateContent,newClassName,eitityPackage);
				System.out.println("[覆盖实体类]"+newClassName+"成功了!!!!!");
			}
		}
	}
	
	/**
	 * 实体类创建
	 * @throws Exception
	 */
	public static void entityClass() throws Exception{
		String newClassName = getHomeDir(entityPackageSt)+entityClass+".java";
		//获取对应的模板
		String templateContent = FileUtils.reanFile(getHomeDir("src/main/java/com/xiaosen/temp")+"entity.txt");
		//拿到表对应的属性和getSet
		String entityStr = GenEntity.entityStr(tableName,"entity","");
		//判断目录是否存在 不存在就创建
		new File(newClassName).getParentFile().mkdirs();
		if (!FileUtils.isExist(newClassName)) {
			buildClass(templateContent+entityStr+"\r\n}",newClassName,eitityPackage);
			System.out.println("[创建实体类]"+newClassName+"成功了!!!!!");
		} else {
			System.err.println("实体类已经存在是否覆盖?  y覆盖");
			BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
			String line = reader.readLine();
			if (null != line && line.equalsIgnoreCase("y")) {
				buildClass(templateContent+entityStr+"\r\n}",newClassName,eitityPackage);
				System.out.println("[覆盖实体类]"+newClassName+"成功了!!!!!");
			}
		}
	}
	
	/**
	 * 实体xml
	 * @throws Exception
	 */
	public static void xmlClass() throws Exception{
		String newClassName = getHomeDir(xmlPackageSt)+model+".xml";
		//获取对应的模板
		String templateContent = FileUtils.reanFile(getHomeDir("src/main/java/com/xiaosen/temp")+"xml.txt");
		//拿到表对应的属性和getSet
		String entityStr = GenEntity.entityStr(tableName,"xml",eitityPackage+"."+entityClass);
		//判断目录是否存在 不存在就创建
		new File(newClassName).getParentFile().mkdirs();
		if (!FileUtils.isExist(newClassName)) {
			buildClass(templateContent+entityStr+"\r\n</mapper>",newClassName,eitityPackage);
			System.out.println("[创建实体类]"+newClassName+"成功了!!!!!");
		} else {
			System.err.println("实体类已经存在是否覆盖?  y覆盖");
			BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
			String line = reader.readLine();
			if (null != line && line.equalsIgnoreCase("y")) {
				buildClass(templateContent+entityStr+"\r\n</mapper>",newClassName,eitityPackage);
				System.out.println("[覆盖实体类]"+newClassName+"成功了!!!!!");
			}
		}
	}
	
	
	/**
	 * 生成list.jsp页面
	 * @throws Exception
	 */
	public static void listjsp() throws Exception{
		String newClassName = getHomeDir(listPackageSt)+"list.jsp";
		//获取对应的模板
		String templateContent = FileUtils.reanFile(getHomeDir("src/main/java/com/xiaosen/temp")+"list.txt");
		//判断目录是否存在 不存在就创建
		new File(newClassName).getParentFile().mkdirs();
		if (!FileUtils.isExist(newClassName)) {
			buildClass(templateContent,newClassName,eitityPackage);
			System.out.println("[创建实体类]"+newClassName+"成功了!!!!!");
		} else {
			System.err.println("实体类已经存在是否覆盖?  y覆盖");
			BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
			String line = reader.readLine();
			if (null != line && line.equalsIgnoreCase("y")) {
				buildClass(templateContent,newClassName,eitityPackage);
				System.out.println("[覆盖实体类]"+newClassName+"成功了!!!!!");
			}
		}
	}
	
	/**
	 * 获取工程的目录
	 * @param path
	 * @return
	 */
	public static String getHomeDir(String path){
		if (StringUtils.isNotEmpty(path)) {
			return coversionSpecialCharacters(System.getProperty("user.dir"))+"/"+path+"/";
		} else {
			return System.getProperty("user.dir");
		}
	}
	
	/**
	 * 转换路径中的斜杠
	 * @param str
	 * @return
	 */
	public static String coversionSpecialCharacters(String path){
		return path.replaceAll("\\\\", "/");
	}
	
	/**
	 * 模板内容替换
	 * @param tmplateContent
	 * @param newFilePath
	 */
	public static void buildClass(String tmplateContent, String newFilePath, String pkg){
		tmplateContent = tmplateContent
				.replaceAll("\\[author\\]", author)
				.replaceAll("\\[date\\]", date)
				.replaceAll("\\[descritpion\\]", descritpion)
				.replaceAll("\\[entityClass\\]", entityClass)
				.replaceAll("\\[lowerEntity\\]", lowerEntity)
				.replaceAll("\\[controllerPackage\\]", controllerPackage)
				.replaceAll("\\[servicePackage\\]", servicePackage)
				.replaceAll("\\[serviceImplPackage\\]", serviceImplPackage)
				.replaceAll("\\[daoPackage\\]", daoPackage)
				.replaceAll("\\[entityPackage\\]", eitityPackage);
		FileUtils.writerFileByLine(tmplateContent,newFilePath);
	}
	
	public static void main(String[] args) {
		try {
			createControllerClass();
			createServiceClass();
			createServiceImplClass();
			createDaoClass();
			entityClass();
			listjsp();
			xmlClass();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

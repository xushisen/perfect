package com.xiaosen.controller.tld;

import java.io.IOException;
import java.io.Writer;
import java.util.Map;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

public class FreemarkerPage implements TemplateDirectiveModel{

	private int count = 0; //总条数    需要动态改
	private int pagesize = 15;  //每页的数量 默认15条 改这里记得154行的15也要改
	private int page = 0;   //当前页数   需要动态改
	private int zys = 0;  //总页数
	private int pcys = 7;  //页面上要显示的页数的个数   可以改变
	//private int type = 2;   // 1是只有上下页   2是没有上下页  默认是2
	
	@Override
	public void execute(Environment env, @SuppressWarnings("rawtypes") Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		//String name = params.get("name").toString();
        //List<User> userlist = userDao.findByProperty("name", name);
		if (null == params) throw new RuntimeException("总数没有传入");
		count = Integer.parseInt(params.get("count").toString());
		page = Integer.parseInt(params.get("page").toString());
		pagesize = Integer.parseInt(params.get("pagesize").toString());
		zys = (count+pagesize-1)/pagesize;  //总共的页数
		Writer out = env.getOut();  
		out.write(getYs(count));
		out.write("<script type=\"text/javascript\">function paging(page){document.getElementById(\"pagebegin\").value=page;document.forms[0].submit();}</script>");
		//env.setVariable("userList", defaultObjectWrapperBuilder.build().wrap("sdsd"));
		if (body != null) {
			body.render(env.getOut());
		}
	}
	
	/**
	 * 没有上页下页的那种格式
	 * 当前页老是在中间  然后计算2边的页数  除了刚开始和最后
	 * 默认一共7个  当前页数在最中间   当前页数超过4然后前面出现上一个
	 * @param count
	 * @return
	 */
	private String getYs(int count){
		page = page == 0 ? 7 : page;  //第一次默认弟7页
		StringBuffer buffer = new StringBuffer();
		buffer.append("<div class=\"page\"><ul>");
		if (zys>pcys) {  //总页数大于页面上要显示的分页的数量
			int shang = (int)Math.ceil((float)pcys/2);  //向上取整
			if (page <= shang) {  //当前的页数小于中间的那个页数    也就是只有下一页的情况
				for (int i=1;i<=pcys;i++) {
					if (i == page) {
						buffer.append("<li class=\"bg\" onclick=\"paging("+i+")\">"+i+"</li>");
					} else {
						buffer.append("<li onclick=\"paging("+i+")\">"+i+"</li>");
					}
				}
				buffer.append("<li onclick=\"paging("+(page+1)+")\">下一页</li>");
			} else {
				int xia = (int)Math.floor((float)pcys/2);  //向下取整
				if (page+xia<zys) {  //当前页加上需要在页面显示页数数量的一半  如果大于总页数  证明后面还有  正常拼出  上页下页都有
					buffer.append("<li onclick=\"paging("+(page-1)+")\">上一页</li>");
					for (int i=xia;i>=1;i--) {  //向左拼
						buffer.append("<li onclick=\"paging("+(page-i)+")\">"+(page-i)+"</li>");
					}
					buffer.append("<li class=\"bg\" onclick=\"paging("+page+")\">"+page+"</li>");
					for (int i=1;i<=xia;i++) {   //向右拼
						buffer.append("<li onclick=\"paging("+(page+i)+")\">"+(page+i)+"</li>");
					}
					buffer.append("<li onclick=\"paging("+(page+1)+")\">下一页</li>");
				} else {  //当前页数加上一半小于总页数  从最后往左拼显示在页面上页数数量的个数   只有上一页的情况
					buffer.append("<li>上一页</li>");
					for (int i=pcys-1;i>=0;i--) {
						if ((zys-i) == page) {
							buffer.append("<li class=\"bg\" onclick=\"paging("+(zys-i)+")\">"+(zys-i)+"</li>");
						} else {
							buffer.append("<li onclick=\"paging("+(zys-i)+")\">"+(zys-i)+"</li>");
						}
					}
				}
			}
		}else{  //拼出所有的页数   也就是没有上页下页
			for(int i=1;i<=zys;i++){
				if (i == page) {
					buffer.append("<li class=\"bg\" onclick=\"paging("+i+")\">"+i+"</li>");
				} else {
					buffer.append("<li onclick=\"paging("+i+")\">"+i+"</li>");
				}
			}
		}
		buffer.append("</ul></div>");
		return buffer.toString();
	}

}

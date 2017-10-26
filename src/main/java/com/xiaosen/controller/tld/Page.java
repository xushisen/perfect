package com.xiaosen.controller.tld;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/**   
 * 类描述：自定义标签练习
 *   
 * 创建人：ssxu  
 * 创建时间：2016-10-17 下午2:46:17   
 * 版本 1.0.0
 * 
 * TagSupport的流程图
 * SKIP_BODY 表示不用处理标签体，直接调用doEndTag()方法。
 * SKIP_PAGE 忽略标签后面的JSP内容。
 * EVAL_PAGE 在标签体处理完后继续处理后面的JSP内容
 * EVAL_BODY_BUFFERED 表示需要处理标签体。
 * EVAL_BODY_INCLUDE 表示需要处理标签体,但绕过setBodyContent()和doInitBody()方法
 * EVAL_BODY_AGAIN 对标签体循环处理。
 *
 */
public class Page extends TagSupport{

	private static final long serialVersionUID = 1L;
	private int count = 0; //总条数    需要动态改
	private int pagesize = 15;  //每页的数量 默认15条 改这里记得154行的15也要改
	private int page = 0;   //当前页数   需要动态改
	private int zys = 0;  //总页数
	private int pcys = 7;  //页面上要显示的页数的个数   可以改变
	private int type = 2;   // 1是只有上下页   2是没有上下页  默认是2
	
	public int doStartTag() throws JspException{
		 try {
			zys = (count+pagesize-1)/pagesize;  //总共的页数
            JspWriter out = this.pageContext.getOut();
            if (type == 1) {
            	out.println(getSyXy(count));  //有上一页下一页
            } else if (type == 2){
            	out.println(getYs(count));  //没有上一页下一页
            } else {   //用作权限
            	return TagSupport.EVAL_BODY_INCLUDE;  //返回这个就是执行jsp页面自定义标签里面的内容
            }
            out.println("<script type=\"text/javascript\">function paging(page){document.getElementById(\"pagebegin\").value=page;document.forms[0].submit();}</script>");
        } catch(Exception e) {
            throw new JspException(e.getMessage());
        }
		 return SKIP_BODY;   //不用处理标签体  直接输出
	}

	/**
	 * 自定义标签  格式只有上一页下一页
	 * @param count
	 * @return
	 */
	private String getSyXy(int count){
		StringBuffer s = new StringBuffer();
		s.append("<div class=\"page\"><ul>");
		s.append("<li>共"+count+"条数据</li><li>共"+zys+"页</li><li>当前第"+page+"页</li>");
		if (page>1) {
			s.append("<li onclick=\"paging(1)\">首页</li>");
			s.append("<li onclick=\"paging("+(page-1)+")\">上一页</li>");
		}
		if (page<zys) {
			s.append("<li onclick=\"paging("+(page+1)+")\">下一页</li>");
		}
		if (page != zys) {
			s.append("<li onclick=\"paging("+zys+")\">末页</li>");
		}
		s.append("</ul></div>");
		return s.toString();
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
	
	/**
	 * 计算分页需要的数据
	 * @param pagebegin 页面传过来的当前页数
	 * @param pagesizess 页面传过来的每页的数量
	 * @return
	 */
	public Map<String,Object> getPage(String pagebegin,String pagesizess){
		Map<String,Object> pageMap = new HashMap<String, Object>();
		int pagebegins = null == pagebegin || "".equals(pagebegin) ? 1 : Integer.parseInt(pagebegin);  //第几页
		int pagesizes = null == pagesizess ? pagesize : Integer.parseInt(pagesizess);  //每页多少条  如果要改变每页的数量
		pageMap.put("pagebegin", pagebegins); //开始页数
		pageMap.put("pagesize",  pagesizes); //每页的条数
		return pageMap;
	}
	
	/**
	 * 封装参数包括查询参数和分页的参数
	 * @param params
	 * @return
	 */
	public static Map<String,Object> getPageMap(Map<String,Object> params){
		Map<String,Object> pageMap = new HashMap<String, Object>();
		String pagebeginStr = null == params.get("pagebegin") ? "" : params.get("pagebegin").toString();
		String pagesizeStr = null == params.get("pagesize") ? "" : params.get("pagesize").toString();
		int pagebegins = "".equals(pagebeginStr) ? 1 : Integer.parseInt(pagebeginStr);  //第几页
		int pagesizes = "".equals(pagesizeStr) ? Integer.parseInt("15") : Integer.parseInt(pagesizeStr);  //每页多少条  如果要改变每页的数量
		pageMap.put("pagebegin", pagebegins); //开始页数
		pageMap.put("pagesize",  pagesizes); //每页的条数
		params.putAll(pageMap);
		return params;
	}
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getpagesize() {
		return pagesize;
	}

	public void setpagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	
	public static void main(String[] args) {
		System.out.println((int)Math.floor((float)9/2)); //向下取整
		System.out.println((int)Math.ceil((float)7/2)); //向上取整
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
}

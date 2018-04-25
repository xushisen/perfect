package com.xiaosen.entity;

/**
 * 
 * 类描述：异步实体类 创建人：ssxu 创建时间：2018-2-28 上午11:09:47
 * 
 * @version 1.0
 * 
 */
public class Ajax {
	private String status;
	private String content;

	public Ajax(String status){
		this.status = status;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}

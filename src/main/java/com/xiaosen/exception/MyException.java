package com.xiaosen.exception;

/**
 * 
 * 类描述:自定义异常
 * 创建人:ssxu
 * 创建时间:2018-4-25 下午2:37:20
 * @version  1.0
 */
public class MyException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	private String code;

	public MyException(String code, String message) {
		super(message);
		this.code = code;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}

package com.xiaosen.exception;

import com.xiaosen.entity.Ajax;
import com.xiaosen.util.statics.StaticVariable;
import com.xiaosen.util.string.StringUtils;

/**
 * 
 * 类描述: 异步返回的工具类
 * 创建人:ssxu
 * 创建时间:2018-4-25 下午2:36:49
 * @version  1.0
 */
public class AjaxUtil {
	public static Ajax success(String code,Object object) {
        Ajax result = new Ajax(code);
        result.setContent(StringUtils.isEmpty(object) ? "" : object.toString());
        return result;
    }

    public static Ajax error(String code, String msg) {
        Ajax result = new Ajax(StaticVariable.AJAXERROR);
        result.setContent(msg);
        return result;
    }
}

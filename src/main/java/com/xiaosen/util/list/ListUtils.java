package com.xiaosen.util.list;

import java.util.List;

public class ListUtils {

	/**
	 * list为空
	 * @param list
	 * @return true 为空  false不为空
	 */
	@SuppressWarnings({"rawtypes"})
	public static boolean isEmpty(List list){
		if (null == list) {
			 return true;
		} else if (list.isEmpty()) {
			return true;
		}
		return false;
	}
	
	/**
	 * 判断list不为空
	 * @param list
	 * @return true 不为空  false 为空
	 */
	@SuppressWarnings({"rawtypes"})
	public static boolean isNotEmpty(List list){
		return !isEmpty(list);
	}
	
}

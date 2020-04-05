package cn.dblearn.blog.common.util;

import java.util.HashMap;

/**
 * MapUtils
 *
 * @author zhy
 * @date 2020-03-22 19:38
 * @email 2838635235@qq.com
 * @description Map工具类
 */
public class MapUtils extends HashMap<String,Object> {

    @Override
    public MapUtils put(String key, Object value) {
        super.put(key,value);
        return this;
    }
}

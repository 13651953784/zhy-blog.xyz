package cn.dblearn.blog.portal.common.annotation;

import java.lang.annotation.*;

/**
 * ViewLog
 *
 * @author zhy
 * @date 2019/02/15 14:51
 * @email 2838635235@qq.com
 * @description
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface LogView {

     String type();
}

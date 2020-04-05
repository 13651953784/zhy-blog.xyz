package cn.dblearn.blog.entity.sys.form;

import lombok.Data;

/**
 * SysLoginForm
 *
 * @author zhy
 * @date 2020-03-20 14:51
 * @email 2838635235@qq.com
 * @description 登录表单对象
 */
@Data
public class SysLoginForm {
    private String username;
    private String password;
    private String captcha;
    private String uuid;
}

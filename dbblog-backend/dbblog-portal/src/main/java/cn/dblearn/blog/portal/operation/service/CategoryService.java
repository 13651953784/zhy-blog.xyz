package cn.dblearn.blog.portal.operation.service;

import cn.dblearn.blog.entity.operation.Category;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * CategoryService
 *
 * @author zhy
 * @date 2019/02/19 15:33
 * @email 2838635235@qq.com
 * @description
 */
public interface CategoryService extends IService<Category> {

    /**
     * 获取categoryList
     * @param params
     * @return
     */
    List<Category> listCategory(Map<String, Object> params);
}

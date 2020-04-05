package cn.dblearn.blog.mapper.log;

import cn.dblearn.blog.entity.log.LogView;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 阅读日志 Mapper 接口
 * </p>
 *
 * @author zhy
 * @since 2020-02-15
 */
@Mapper
public interface LogViewMapper extends BaseMapper<LogView> {

}

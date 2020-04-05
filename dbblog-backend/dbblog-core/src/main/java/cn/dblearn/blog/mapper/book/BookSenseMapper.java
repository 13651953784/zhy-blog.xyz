package cn.dblearn.blog.mapper.book;

import cn.dblearn.blog.entity.book.BookSense;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 读后感 Mapper 接口
 * </p>
 *
 * @author zhy
 * @since 2020-02-13
 */
@Mapper
public interface BookSenseMapper extends BaseMapper<BookSense> {

}

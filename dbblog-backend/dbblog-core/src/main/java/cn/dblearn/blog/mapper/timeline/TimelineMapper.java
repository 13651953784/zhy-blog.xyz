package cn.dblearn.blog.mapper.timeline;

import cn.dblearn.blog.entity.timeline.Timeline;
import cn.dblearn.blog.entity.timeline.TimelinePost;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * TimeLineMapper
 *
 * @author zhy
 * @date 2019/02/24 20:53
 * @email 2838635235@qq.com
 * @description
 */
@Mapper
public interface TimelineMapper {

    List<TimelinePost> listTimelinePost(@Param("year") Integer year, @Param("month") Integer month);

    List<Timeline> listTimeline();
}

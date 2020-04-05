package cn.dblearn.blog.portal.timeline.service;

import cn.dblearn.blog.entity.timeline.Timeline;

import java.util.List;

/**
 * TimeLineService
 *
 * @author zhy
 * @date 2019/02/24 20:47
 * @email 2838635235@qq.com
 * @description
 */
public interface TimelineService {

    /**
     * 获取timeLine数据
     * @return
     */
    List<Timeline> listTimeLine();
}

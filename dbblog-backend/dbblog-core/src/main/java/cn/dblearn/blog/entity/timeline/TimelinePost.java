package cn.dblearn.blog.entity.timeline;

import lombok.Data;

import java.util.Date;

/**
 * TimeLineData
 *
 * @author zhy
 * @date 2019/02/24 20:39
 * @email 2838635235@qq.com
 * @description
 */
@Data
public class TimelinePost {

    private Integer id;

    private String title;

    private String description;

    private String postType;

    private Date createTime;

}

package com.robotautomatic.robotshop.admin.dao;

import com.funtl.my.shop.commons.persistence.BaseDao;
import com.robotautomatic.robotshop.domain.TbContent;
import org.springframework.stereotype.Repository;

@Repository
public interface TbContentDao extends BaseDao<TbContent> {
    /**
     * 根据类目 ID 删除内容
     *
     * @param categoryIds
     */
    void deleteByCategoryId(String[] categoryIds);
}

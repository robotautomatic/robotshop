package com.robotautomatic.robotshop.admin.service;

import com.funtl.my.shop.commons.persistence.BaseService;
import com.robotautomatic.robotshop.domain.TbContent;

public interface TbContentService extends BaseService<TbContent> {
    /**
     * 根据类目 ID 删除内容
     * @param categoryIds
     */
    void deleteByCategoryId(String[] categoryIds);
}

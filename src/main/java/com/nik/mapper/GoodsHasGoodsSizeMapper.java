package com.nik.mapper;

import com.nik.po.GoodsHasGoodsSize;
import com.nik.po.GoodsHasGoodsSizeExample;
import com.nik.po.GoodsHasGoodsSizeKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GoodsHasGoodsSizeMapper {
    int countByExample(GoodsHasGoodsSizeExample example);

    int deleteByExample(GoodsHasGoodsSizeExample example);

    int deleteByPrimaryKey(GoodsHasGoodsSizeKey key);

    int insert(GoodsHasGoodsSize record);

    int insertSelective(GoodsHasGoodsSize record);

    List<GoodsHasGoodsSize> selectByExample(GoodsHasGoodsSizeExample example);

    GoodsHasGoodsSize selectByPrimaryKey(GoodsHasGoodsSizeKey key);

    int updateByExampleSelective(@Param("record") GoodsHasGoodsSize record, @Param("example") GoodsHasGoodsSizeExample example);

    int updateByExample(@Param("record") GoodsHasGoodsSize record, @Param("example") GoodsHasGoodsSizeExample example);

    int updateByPrimaryKeySelective(GoodsHasGoodsSize record);

    int updateByPrimaryKey(GoodsHasGoodsSize record);
}
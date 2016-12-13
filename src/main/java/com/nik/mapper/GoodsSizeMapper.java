package com.nik.mapper;

import com.nik.po.GoodsSize;
import com.nik.po.GoodsSizeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GoodsSizeMapper {
    int countByExample(GoodsSizeExample example);

    int deleteByExample(GoodsSizeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(GoodsSize record);

    int insertSelective(GoodsSize record);

    List<GoodsSize> selectByExample(GoodsSizeExample example);

    GoodsSize selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") GoodsSize record, @Param("example") GoodsSizeExample example);

    int updateByExample(@Param("record") GoodsSize record, @Param("example") GoodsSizeExample example);

    int updateByPrimaryKeySelective(GoodsSize record);

    int updateByPrimaryKey(GoodsSize record);
}
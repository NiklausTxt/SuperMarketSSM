package com.nik.mapper;

import com.nik.po.GoodsType;
import com.nik.po.GoodsTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GoodsTypeMapper {
    int countByExample(GoodsTypeExample example);

    int deleteByExample(GoodsTypeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(GoodsType record);

    int insertSelective(GoodsType record);

    List<GoodsType> selectByExample(GoodsTypeExample example);

    GoodsType selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") GoodsType record, @Param("example") GoodsTypeExample example);

    int updateByExample(@Param("record") GoodsType record, @Param("example") GoodsTypeExample example);

    int updateByPrimaryKeySelective(GoodsType record);

    int updateByPrimaryKey(GoodsType record);
}
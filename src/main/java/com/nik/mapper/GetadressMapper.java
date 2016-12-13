package com.nik.mapper;

import com.nik.po.Getadress;
import com.nik.po.GetadressExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GetadressMapper {
    int countByExample(GetadressExample example);

    int deleteByExample(GetadressExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Getadress record);

    int insertSelective(Getadress record);

    List<Getadress> selectByExample(GetadressExample example);

    Getadress selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Getadress record, @Param("example") GetadressExample example);

    int updateByExample(@Param("record") Getadress record, @Param("example") GetadressExample example);

    int updateByPrimaryKeySelective(Getadress record);

    int updateByPrimaryKey(Getadress record);
}
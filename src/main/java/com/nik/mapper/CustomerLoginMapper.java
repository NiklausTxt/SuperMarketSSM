package com.nik.mapper;

import com.nik.po.CustomerLogin;
import com.nik.po.CustomerLoginExample;
import com.nik.po.CustomerLoginKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CustomerLoginMapper {
    int countByExample(CustomerLoginExample example);

    int deleteByExample(CustomerLoginExample example);

    int deleteByPrimaryKey(CustomerLoginKey key);

    int insert(CustomerLogin record);

    int insertSelective(CustomerLogin record);

    List<CustomerLogin> selectByExample(CustomerLoginExample example);

    CustomerLogin selectByPrimaryKey(CustomerLoginKey key);

    int updateByExampleSelective(@Param("record") CustomerLogin record, @Param("example") CustomerLoginExample example);

    int updateByExample(@Param("record") CustomerLogin record, @Param("example") CustomerLoginExample example);

    int updateByPrimaryKeySelective(CustomerLogin record);

    int updateByPrimaryKey(CustomerLogin record);
}
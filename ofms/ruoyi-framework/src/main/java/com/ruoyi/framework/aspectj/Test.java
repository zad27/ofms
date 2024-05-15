package com.ruoyi.framework.aspectj;

import com.alibaba.druid.sql.ast.SQLStatement;
import com.alibaba.druid.sql.dialect.mysql.ast.statement.MySqlInsertStatement;
import com.alibaba.druid.sql.dialect.mysql.parser.MySqlSelectParser;
import com.alibaba.druid.sql.dialect.mysql.parser.MySqlStatementParser;
import com.alibaba.druid.sql.dialect.mysql.visitor.MySqlSchemaStatVisitor;
import com.alibaba.druid.sql.parser.SQLStatementParser;
import com.alibaba.fastjson.JSON;

public class Test {
    public static void main(String[] args) {
        String sql = "select id,name from user";

        SQLStatementParser parser = new MySqlStatementParser(sql);
        SQLStatement statement = parser.parseStatement();
//        System.out.println(JSON.toJSONString(statement));


//        MySqlInsertStatement insert = (MySqlInsertStatement)statement;

        MySqlSchemaStatVisitor visitor = new MySqlSchemaStatVisitor();
        statement.accept(visitor);
        System.out.println(JSON.toJSONString(visitor));
    }
}

import request from '@/utils/request'


/**
 * 运行sql语句
 */
export function runWithSql(datasourceid,database,sql) {
  const data = {
    datasourceid,
    database,
    sql
  }

  return request({
    url: '/report/prebuild/runWithSql',
    method: 'get',
    params: data
  })
}

/**
 * 验证SQL
 * @param type
 * @param sql
 */
export function checkWithSql(type,sql){
  const data = {
    type,
    sql
  }

  return request({
    url: '/report/prebuild/checkWithSql',
    method: 'get',
    params: data
  })
}

/**
 * 获取数据库中的用户表
 */
export function getTableList(datasourceid,database) {
  const data = {
    datasourceid,
    database
  }

  return request({
    url: '/report/prebuild/getTableList',
    method: 'get',
    params: data
  })
}

/**
 * 获取表的字段信息
 */
export function getTableColnums(datasourceid,database,tablename) {
  const data = {
    datasourceid,
    database,
    tablename
  }

  return request({
    url: '/report/prebuild/getTableColnums',
    method: 'get',
    params: data
  })
}

/**
 * 获取数据源信息，加载至下拉列表
 */
export function getDataSource(){
  return request({
    url: '/report/prebuild/getdatasource',
    method: 'get'
  })
}



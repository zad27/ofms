import request from '@/utils/request'

// 查询报数据源管理列表
export function listResource(query) {
  return request({
    url: '/report/resource/list',
    method: 'get',
    params: query
  })
}

// 查询报数据源管理详细
export function getResource(id) {
  return request({
    url: '/report/resource/' + id,
    method: 'get'
  })
}

//测试数据库连接
export function testResource(data){
  return request({
    url: '/report/resource/test',
    method: 'get',
    params: data
  })
}

// 新增报数据源管理
export function addResource(data) {
  return request({
    url: '/report/resource',
    method: 'post',
    data: data
  })
}

// 修改报数据源管理
export function updateResource(data) {
  return request({
    url: '/report/resource',
    method: 'put',
    data: data
  })
}

// 删除报数据源管理
export function delResource(id) {
  return request({
    url: '/report/resource/' + id,
    method: 'delete'
  })
}

// 导出报数据源管理
export function exportResource(query) {
  return request({
    url: '/report/resource/export',
    method: 'get',
    params: query
  })
}

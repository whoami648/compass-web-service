# frozen_string_literal: true

module Openapi
  module Entities
    # 缺陷议题开放时间指标详情
    class BugIssueOpenTimeMetricDetail < Grape::Entity
      expose :bug_issue_open_time_avg,
             documentation: {
               type: 'Float',
               desc: '平均缺陷议题开放时间（小时）',
               example: nil,
               nullable: true
             }

      expose :bug_issue_open_time_mid,
             documentation: {
               type: 'Float',
               desc: '中位数缺陷议题开放时间（小时）',
               example: nil,
               nullable: true
             }
    end

    # 单条指标记录
    class IssueBugOpenTimeItem < Grape::Entity
      expose :uuid, documentation: {
        type: 'String',
        desc: '唯一标识符',
        example: '53f7062229257ecac178e28b4204730cbf792911'
      }

      expose :level, documentation: {
        type: 'String',
        desc: '分析层级',
        example: 'repo',
        values: %w[repo org]
      }

      expose :label, documentation: {
        type: 'String',
        desc: '仓库地址',
        example: 'https://github.com/oss-compass/compass-web-service'
      }

      expose :metric_type, documentation: {
        type: 'String',
        desc: '指标分类',
        example: 'community_portrait'
      }

      expose :metric_name, documentation: {
        type: 'String',
        desc: '指标名称',
        example: 'bug_issue_open_time'
      }

      expose :metric_detail, using: Entities::BugIssueOpenTimeMetricDetail,
                             documentation: {
                               type: 'BugIssueOpenTimeMetricDetail',
                               desc: '时间指标详情',
                               param_type: 'body'
                             }

      expose :version_number, documentation: {
        type: 'Integer',
        desc: '数据版本号',
        example: nil,
        nullable: true
      }

      expose :grimoire_creation_date, documentation: {
        type: 'String',
        desc: '指标计算时间',
        example: '2025-02-10T00:00:00+00:00'
      }

      expose :metadata__enriched_on, documentation: {
        type: 'String',
        desc: '元数据更新时间',
        example: '2025-05-14T07:28:32.800642+00:00'
      }
    end

    # 分页响应结构
    class IssueBugOpenTimeResponse < Grape::Entity
      expose :count, documentation: {
        type: 'Integer',
        desc: '总记录数',
        example: 50
      }

      expose :total_page, documentation: {
        type: 'Integer',
        desc: '总页数',
        example: 3
      }

      expose :page, documentation: {
        type: 'Integer',
        desc: '当前页码',
        example: 1
      }

      expose :items, using: Entities::IssueBugOpenTimeItem,
                     documentation: {
                       type: 'IssueBugOpenTimeItem',
                       desc: '指标数据列表',
                       is_array: true,
                       param_type: 'body'
                     }
    end
  end
end

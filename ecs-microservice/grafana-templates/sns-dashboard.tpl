{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "description": "Visualize AWS SNS metrics",
  "editable": true,
  "gnetId": 581,
  "graphTooltip": 0,
  "id": null,
  "iteration": 1529018086150,
  "links": [],
  "panels": [
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "${name_prefix}-${environment}",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 1,
      "isNew": true,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": true,
        "values": true
      },
      "lines": true,
      "linewidth": 2,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "{{TopicName}}",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "TopicName": "$topic"
          },
          "functions": [],
          "group": {
            "filter": ""
          },
          "highResolution": false,
          "host": {
            "filter": ""
          },
          "item": {
            "filter": ""
          },
          "metricName": "NumberOfMessagesPublished",
          "mode": 0,
          "namespace": "AWS/SNS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "${region}",
          "statistics": [
            "Sum"
          ]
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "NumberOfMessagesPublished",
      "tooltip": {
        "msResolution": false,
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "none",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": 0,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "${name_prefix}-${environment}",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 7
      },
      "id": 4,
      "isNew": true,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 2,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "{{TopicName}}_develivered",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "TopicName": "$topic"
          },
          "functions": [],
          "group": {
            "filter": ""
          },
          "highResolution": false,
          "host": {
            "filter": ""
          },
          "item": {
            "filter": ""
          },
          "metricName": "NumberOfNotificationsDelivered",
          "mode": 0,
          "namespace": "AWS/SNS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "${region}",
          "statistics": [
            "Sum"
          ]
        },
        {
          "alias": "{{TopicName}}_failed",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "TopicName": "$topic"
          },
          "functions": [],
          "group": {
            "filter": ""
          },
          "highResolution": false,
          "host": {
            "filter": ""
          },
          "item": {
            "filter": ""
          },
          "metricName": "NumberOfNotificationsFailed",
          "mode": 0,
          "namespace": "AWS/SNS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "B",
          "region": "${region}",
          "statistics": [
            "Sum"
          ]
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Notifications",
      "tooltip": {
        "msResolution": false,
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "none",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": 0,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "${name_prefix}-${environment}",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 14
      },
      "id": 3,
      "isNew": true,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": true,
        "values": true
      },
      "lines": true,
      "linewidth": 2,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "{{TopicName}}",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "TopicName": "$topic"
          },
          "functions": [],
          "group": {
            "filter": ""
          },
          "highResolution": false,
          "host": {
            "filter": ""
          },
          "item": {
            "filter": ""
          },
          "metricName": "PublishSize",
          "mode": 0,
          "namespace": "AWS/SNS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "${region}",
          "statistics": [
            "Sum"
          ]
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "PublishSize",
      "tooltip": {
        "msResolution": false,
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": 0,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "${name_prefix}-${environment}",
      "editable": true,
      "error": false,
      "fill": 1,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 21
      },
      "id": 6,
      "isNew": true,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "show": true,
        "sort": "current",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 2,
      "links": [],
      "nullPointMode": "connected",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "{{TopicName}}",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "TopicName": "$topic"
          },
          "functions": [],
          "group": {
            "filter": ""
          },
          "host": {
            "filter": ""
          },
          "item": {
            "filter": ""
          },
          "metricName": "SMSSuccessRate",
          "mode": 0,
          "namespace": "AWS/SNS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "${region}",
          "statistics": [
            "Average"
          ]
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "SMSSuccessRate",
      "tooltip": {
        "msResolution": false,
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "none",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": 0,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "content": "",
      "editable": true,
      "error": false,
      "gridPos": {
        "h": 3,
        "w": 24,
        "x": 0,
        "y": 28
      },
      "id": 2,
      "isNew": true,
      "links": [],
      "mode": "html",
      "title": "Documentation",
      "type": "text"
    }
  ],
  "refresh": false,
  "schemaVersion": 16,
  "style": "dark",
  "tags": [
    "terraform",
    "${name}",
    "${environment}",
    "${name_prefix}"
  ],
  "templating": {
    "list": [
      {
        "allValue": null,
        "current": {
          "selected": false,
          "text": "All",
          "value": [
            "$__all"
          ]
        },
        "datasource": "${name_prefix}-${environment}",
        "definition": "dimension_values(${region},AWS/SNS,NumberOfMessagesPublished,TopicName)",
        "hide": 2,
        "includeAll": true,
        "label": "Topic name",
        "multi": true,
        "name": "topic",
        "options": [],
        "query": "dimension_values(${region},AWS/SNS,NumberOfMessagesPublished,TopicName)",
        "refresh": 1,
        "regex": "${topic_name_filter}",
        "skipUrlSync": false,
        "sort": 0,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      }
    ]
  },
  "time": {
    "from": "now-24h",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "browser",
  "title": "${name}",
  "uid": "${uuid}",
  "version": 1
}
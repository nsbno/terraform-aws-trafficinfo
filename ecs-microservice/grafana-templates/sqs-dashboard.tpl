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
  "description": "Visualize AWS SQS metrics",
  "editable": true,
  "gnetId": 584,
  "graphTooltip": 0,
  "id": null,
  "iteration": 1529069302464,
  "links": [],
  "panels": [
    {
      "aliasColors": {},
      "datasource": "${name_prefix}-${environment}",
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 8,
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
        "total": false,
        "values": true
      },
      "linewidth": 2,
      "nullPointMode": "connected",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "title": "Messages",
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
      },
      "targets": [
        {
          "alias": "",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "QueueName": "${queue_name}"
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
          "metricName": "NumberOfMessagesSent",
          "mode": 0,
          "namespace": "AWS/SQS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "${queue_name}",
          "region": "${region}",
          "statistics": [
            "Average"
          ]
        }
      ]
    },
    {
      "aliasColors": {},
      "datasource": "${name_prefix}-${environment}",
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 0,
        "y": 8
      },
      "id": 2,
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
      "linewidth": 2,
      "nullPointMode": "connected",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "title": "Messages",
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
      },
      "targets": [
        {
          "alias": "",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "QueueName": "${queue_name}"
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
          "metricName": "NumberOfMessagesDeleted",
          "mode": 0,
          "namespace": "AWS/SQS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "${queue_name}",
          "region": "${region}",
          "statistics": [
            "Average"
          ]
        }
      ]
    },
    {
      "aliasColors": {},
      "datasource": "${name_prefix}-${environment}",
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 0,
        "y": 16
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
        "total": false,
        "values": true
      },
      "linewidth": 2,
      "nullPointMode": "connected",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "title": "Messages",
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
      },
      "targets": [
        {
          "alias": "",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "QueueName": "${queue_name}"
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
          "metricName": "NumberOfMessagesReceived",
          "mode": 0,
          "namespace": "AWS/SQS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "${queue_name}",
          "region": "${region}",
          "statistics": [
            "Average"
          ]
        }
      ]
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
        "y": 8
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
          "alias": "",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "QueueName": "${queue_name}"
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
          "metricName": "ApproximateAgeOfOldestMessage",
          "mode": 0,
          "namespace": "AWS/SQS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "$region",
          "statistics": [
            "Average"
          ]
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "ApproximateAgeOfOldestMessage",
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
          "format": "s",
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
        "y": 15
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
          "alias": "",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "QueueName": "${queue_name}"
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
          "metricName": "ApproximateNumberOfMessagesVisible",
          "mode": 0,
          "namespace": "AWS/SQS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "C",
          "region": "$region",
          "statistics": [
            "Average"
          ]
        },
        {
          "alias": "",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "QueueName": "${queue_name}"
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
          "metricName": "ApproximateNumberOfMessagesNotVisible",
          "mode": 0,
          "namespace": "AWS/SQS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "$region",
          "statistics": [
            "Average"
          ]
        },
        {
          "alias": "",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "QueueName": "${queue_name}"
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
          "metricName": "ApproximateNumberOfMessagesDelayed",
          "mode": 0,
          "namespace": "AWS/SQS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "B",
          "region": "$region",
          "statistics": [
            "Average"
          ]
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "ApproximateNumberOfMessages",
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
        "y": 22
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
          "alias": "",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "QueueName": "${queue_name}"
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
          "metricName": "NumberOfEmptyReceives",
          "mode": 0,
          "namespace": "AWS/SQS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "$region",
          "statistics": [
            "Average"
          ]
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "NumberOfEmptyReceives",
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
        "y": 29
      },
      "id": 10,
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
          "alias": "",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "QueueName": "${queue_name}"
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
          "metricName": "SentMessageSize",
          "mode": 0,
          "namespace": "AWS/SQS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "$region",
          "statistics": [
            "Average"
          ]
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "SentMessageSize",
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
    "list": []
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
  "title": "AWS SQS",
  "uid": "${uuid}",
  "version": 1
}
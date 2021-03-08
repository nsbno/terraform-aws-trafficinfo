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
  "iteration": 1614255833945,
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
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 0,
        "y": 0
      },
      "hiddenSeries": false,
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
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "{{QueueName}}",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "QueueName": "$queue"
          },
          "expression": "",
          "functions": [],
          "group": {
            "filter": ""
          },
          "host": {
            "filter": ""
          },
          "id": "",
          "item": {
            "filter": ""
          },
          "matchExact": true,
          "metricName": "NumberOfMessagesSent",
          "mode": 0,
          "namespace": "AWS/SQS",
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
      "timeRegions": [],
      "timeShift": null,
      "title": "Messages Sent",
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
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 8,
        "y": 0
      },
      "hiddenSeries": false,
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
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "{{QueueName}}",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "QueueName": "$queue"
          },
          "expression": "",
          "functions": [],
          "group": {
            "filter": ""
          },
          "host": {
            "filter": ""
          },
          "id": "",
          "item": {
            "filter": ""
          },
          "matchExact": true,
          "metricName": "NumberOfMessagesReceived",
          "mode": 0,
          "namespace": "AWS/SQS",
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
      "timeRegions": [],
      "timeShift": null,
      "title": "Messages Received",
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
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 16,
        "y": 0
      },
      "hiddenSeries": false,
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
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 1,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "{{QueueName}}",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "QueueName": "$queue"
          },
          "expression": "",
          "functions": [],
          "group": {
            "filter": ""
          },
          "host": {
            "filter": ""
          },
          "id": "",
          "item": {
            "filter": ""
          },
          "matchExact": true,
          "metricName": "NumberOfMessagesDeleted",
          "mode": 0,
          "namespace": "AWS/SQS",
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
      "timeRegions": [],
      "timeShift": null,
      "title": "Messages Deleted",
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
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 6,
        "x": 0,
        "y": 8
      },
      "hiddenSeries": false,
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
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "{{QueueName}}",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "QueueName": "$queue"
          },
          "expression": "",
          "functions": [],
          "group": {
            "filter": ""
          },
          "host": {
            "filter": ""
          },
          "id": "",
          "item": {
            "filter": ""
          },
          "matchExact": true,
          "metricName": "ApproximateAgeOfOldestMessage",
          "mode": 0,
          "namespace": "AWS/SQS",
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
      "timeRegions": [],
      "timeShift": null,
      "title": "Approximate Age Of Oldest Message",
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
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 6,
        "x": 6,
        "y": 8
      },
      "hiddenSeries": false,
      "id": 5,
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
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "{{QueueName}}",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "QueueName": "$queue"
          },
          "expression": "",
          "functions": [],
          "group": {
            "filter": ""
          },
          "host": {
            "filter": ""
          },
          "id": "",
          "item": {
            "filter": ""
          },
          "matchExact": true,
          "metricName": "ApproximateNumberOfMessagesDelayed",
          "mode": 0,
          "namespace": "AWS/SQS",
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
      "timeRegions": [],
      "timeShift": null,
      "title": "Approximate Number Of Messages Delayed",
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
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 6,
        "x": 12,
        "y": 8
      },
      "hiddenSeries": false,
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
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "{{QueueName}}",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "QueueName": "$queue"
          },
          "expression": "",
          "functions": [],
          "group": {
            "filter": ""
          },
          "host": {
            "filter": ""
          },
          "id": "",
          "item": {
            "filter": ""
          },
          "matchExact": true,
          "metricName": "ApproximateNumberOfMessagesNotVisible",
          "mode": 0,
          "namespace": "AWS/SQS",
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
      "timeRegions": [],
      "timeShift": null,
      "title": "Approximate Number Of Messages Not Visible",
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
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 6,
        "x": 18,
        "y": 8
      },
      "hiddenSeries": false,
      "id": 7,
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
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "{{QueueName}}",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "QueueName": "$queue"
          },
          "expression": "",
          "functions": [],
          "group": {
            "filter": ""
          },
          "host": {
            "filter": ""
          },
          "id": "",
          "item": {
            "filter": ""
          },
          "matchExact": true,
          "metricName": "ApproximateNumberOfMessagesVisible",
          "mode": 0,
          "namespace": "AWS/SQS",
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
      "timeRegions": [],
      "timeShift": null,
      "title": "Approximate Number Of Messages Visible",
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
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 12
      },
      "hiddenSeries": false,
      "id": 8,
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
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "{{QueueName}}",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "QueueName": "$queue"
          },
          "expression": "",
          "functions": [],
          "group": {
            "filter": ""
          },
          "host": {
            "filter": ""
          },
          "id": "",
          "item": {
            "filter": ""
          },
          "matchExact": true,
          "metricName": "SentMessageSize",
          "mode": 0,
          "namespace": "AWS/SQS",
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
      "timeRegions": [],
      "timeShift": null,
      "title": "Sent Message Size",
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
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 12
      },
      "hiddenSeries": false,
      "id": 9,
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
      "linewidth": 1,
      "links": [],
      "nullPointMode": "connected",
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "alias": "{{QueueName}}",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "QueueName": "$queue"
          },
          "expression": "",
          "functions": [],
          "group": {
            "filter": ""
          },
          "host": {
            "filter": ""
          },
          "id": "",
          "item": {
            "filter": ""
          },
          "matchExact": true,
          "metricName": "NumberOfEmptyReceives",
          "mode": 0,
          "namespace": "AWS/SQS",
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
      "timeRegions": [],
      "timeShift": null,
      "title": "Number Of Empty Receives",
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
    }
  ],
  "refresh": false,
  "schemaVersion": 25,
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
        "definition": "dimension_values(${region},AWS/SQS,NumberOfMessagesReceived,QueueName)",
        "hide": 2,
        "includeAll": true,
        "label": "Queue name",
        "multi": true,
        "name": "queue",
        "options": [],
        "query": "dimension_values(${region},AWS/SQS,NumberOfMessagesReceived,QueueName)",
        "refresh": 1,
        "regex": "${queue_name_filter}",
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
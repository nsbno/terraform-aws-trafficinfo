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
  "description": "Visualize AWS RDS metrics",
  "editable": true,
  "gnetId": 707,
  "graphTooltip": 0,
  "id": null,
  "iteration": 1584743839482,
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
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "hiddenSeries": false,
      "id": 16,
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
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "VolumeIdleTime_Average",
          "yaxis": 2
        },
        {
          "alias": "FailedSQLServerAgentJobsCount_Average",
          "yaxis": 2
        }
      ],
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "CPUUtilization",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "${region}",
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "FailedSQLServerAgentJobsCount",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "B",
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
      "title": "CPUUtilization/FailedSQLServerAgentJobsCount",
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
          "format": "percent",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": 0,
          "show": true
        },
        {
          "format": "cpm",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
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
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 7
      },
      "hiddenSeries": false,
      "id": 18,
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
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "VolumeIdleTime_Average",
          "yaxis": 2
        }
      ],
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "DatabaseConnections",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "${region}",
          "statistics": [
            "Maximum"
          ]
        },
        {
          "alias": "",
          "application": {
            "filter": ""
          },
          "dimensions": {
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "DiskQueueDepth",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "B",
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
      "title": "DatabaseConnections/DiskQueueDepth",
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
          "format": "none",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
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
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 14
      },
      "hiddenSeries": false,
      "id": 17,
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
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "VolumeIdleTime_Average",
          "yaxis": 2
        }
      ],
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "FreeableMemory",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "${region}",
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "FreeStorageSpace",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "B",
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
      "title": "FreeableMemory/FreeStorageSpace",
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
          "format": "bytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
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
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 8,
        "w": 24,
        "x": 0,
        "y": 21
      },
      "hiddenSeries": false,
      "id": 19,
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
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "VolumeIdleTime_Average",
          "yaxis": 2
        },
        {
          "alias": "BurstBalance_Average",
          "yaxis": 2
        }
      ],
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "ReadIOPS",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "${region}",
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "WriteIOPS",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "B",
          "region": "${region}",
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "BurstBalance",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "C",
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
      "title": "ReadIOPS/WriteIOPS/BurstBalance",
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
          "format": "iops",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": 0,
          "show": true
        },
        {
          "format": "percent",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
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
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 29
      },
      "hiddenSeries": false,
      "id": 20,
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
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "VolumeIdleTime_Average",
          "yaxis": 2
        }
      ],
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "ReadLatency",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "${region}",
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "WriteLatency",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "B",
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
      "title": "ReadLatency/WriteLatency",
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
          "format": "none",
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
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 36
      },
      "hiddenSeries": false,
      "id": 21,
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
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "VolumeIdleTime_Average",
          "yaxis": 2
        }
      ],
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "ReadThroughput",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "${region}",
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "WriteThroughput",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "B",
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
      "title": "ReadThroughput/WriteThroughput",
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
          "format": "Bps",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": 0,
          "show": true
        },
        {
          "format": "none",
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
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 43
      },
      "hiddenSeries": false,
      "id": 22,
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
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "VolumeIdleTime_Average",
          "yaxis": 2
        }
      ],
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "NetworkReceiveThroughput",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "${region}",
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "NetworkTransmitThroughput",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "B",
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
      "title": "NetworkReceiveThroughput/NetworkTransmitThroughput",
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
          "format": "Bps",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": 0,
          "show": true
        },
        {
          "format": "none",
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
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 50
      },
      "hiddenSeries": false,
      "id": 23,
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
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "VolumeIdleTime_Average",
          "yaxis": 2
        }
      ],
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "SwapUsage",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "${region}",
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "BinLogDiskUsage",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "B",
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
      "title": "SwapUsage/BinLogDiskUsage",
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
          "format": "bytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
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
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 57
      },
      "hiddenSeries": false,
      "id": 24,
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
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "VolumeIdleTime_Average",
          "yaxis": 2
        }
      ],
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "CPUCreditUsage",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "${region}",
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "CPUCreditBalance",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "B",
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
      "title": "CPUCreditUsage/CPUCreditBalance",
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
          "format": "none",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
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
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 64
      },
      "hiddenSeries": false,
      "id": 25,
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
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "ReplicaLag_Average",
          "yaxis": 2
        }
      ],
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "OldestReplicationSlotLag",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "${region}",
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "ReplicaLag",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "B",
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
      "title": "OldestReplicationSlotLag/ReplicaLag",
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
          "format": "decmbytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": 0,
          "show": true
        },
        {
          "format": "s",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
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
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 71
      },
      "hiddenSeries": false,
      "id": 26,
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
      "options": {
        "dataLinks": []
      },
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "ReplicaLag_Average",
          "yaxis": 2
        }
      ],
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "OldestReplicationSlotLag",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "${region}",
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "ReplicaLag",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "B",
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
      "title": "ReplicationSlotDiskUsage/TransactionLogsDiskUsage",
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
          "format": "decmbytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": 0,
          "show": true
        },
        {
          "format": "s",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
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
      "fillGradient": 0,
      "grid": {},
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 78
      },
      "hiddenSeries": false,
      "id": 27,
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
      "options": {
        "dataLinks": []
      },
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "MaximumUsedTransactionIDs",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "A",
          "region": "${region}",
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
            "DBInstanceIdentifier": "$dbinstanceidentifier"
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
          "metricName": "TransactionLogsGeneration",
          "mode": 0,
          "namespace": "AWS/RDS",
          "options": {
            "showDisabledItems": false
          },
          "period": "",
          "refId": "B",
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
      "title": "MaximumUsedTransactionIDs/TransactionLogsGeneration",
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
          "format": "Bps",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "content": "<a style=\"xfloat: right\" href=\"http://www.monitoringartist.com\" target=\"_blank\" title=\"Dashboard maintained by Monitoring Artist - DevOps / Docker / Kubernetes / AWS ECS / Google GCP / Zabbix / Zenoss / Terraform / Monitoring\"><img src=\"https://monitoringartist.github.io/monitoring-artist-logo-grafana.png\" height=\"30px\" /></a> | \n<a style=\"xfloat: left\"  target=\"_blank\" href=\"https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MonitoringOverview.html#monitoring-cloudwatch\">AWS CloudWatch RDS documentation</a> | \n<a style=\"xfloat: left\"  target=\"_blank\" href=\"https://grafana.com/dashboards/707\">Installed from Grafana.com dashboards</a>",
      "datasource": "${name_prefix}-${environment}",
      "editable": true,
      "error": false,
      "gridPos": {
        "h": 3,
        "w": 24,
        "x": 0,
        "y": 85
      },
      "id": 2,
      "isNew": true,
      "links": [],
      "mode": "html",
      "options": {},
      "title": "Documentation",
      "type": "text"
    }
  ],
  "refresh": false,
  "schemaVersion": 22,
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
        "current": {},
        "hide": 0,
        "includeAll": false,
        "label": "Datasource",
        "multi": false,
        "name": "datasource",
        "options": [],
        "query": "cloudwatch",
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "type": "datasource"
      },
      {
        "allValue": null,
        "current": {},
        "datasource": "${name_prefix}-${environment}",
        "definition": "",
        "hide": 0,
        "includeAll": false,
        "label": "Region",
        "multi": false,
        "name": "region",
        "options": [],
        "query": "regions()",
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "allValue": null,
        "current": {},
        "datasource": "${name_prefix}-${environment}",
        "definition": "",
        "hide": 0,
        "includeAll": false,
        "label": "DBInstanceIdentifier",
        "multi": false,
        "name": "dbinstanceidentifier",
        "options": [],
        "query": "dimension_values(${region}, AWS/RDS, CPUUtilization, DBInstanceIdentifier)",
        "refresh": 1,
        "regex": "",
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
    "from": "now-1h",
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
#### Via API:
  - api-comm-injector model
  - comm-predictor model
    - delayed/recurring:
      - batch-capture
      - batch-processor
    - legacy route:
      - comm-pega
  - comm-enricher model
  - comm-integrator model
#### Via claim:
  - comm-event-processor model
  - sqs-comm-injector model
  - comm-predictor model
    - delayed/recurring:
      - batch-capture
      - old:
        - batch-processor
      - new:
        - batch-queue-process
        - comm-batch-process
    - legacy route (deprecated):
      - comm-pega
  - comm-enricher model
  - comm-integrator model
#### Via external apps (Athena, AppointmentNotification, etc.):
  - comm-sqs-handler model

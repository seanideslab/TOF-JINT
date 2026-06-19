def queue_backlog_status(queue_length, limit=2):
    return 'bounded' if queue_length <= limit else 'backlog'

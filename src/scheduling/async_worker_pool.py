from concurrent.futures import ThreadPoolExecutor

def make_worker_pool(max_workers=2):
    return ThreadPoolExecutor(max_workers=max_workers)

import subprocess
import sys
import os
import time

def run_script(script_path):
    process = subprocess.Popen([sys.executable, script_path])
    return process

if __name__ == "__main__":
    # Абсолютные пути к вашим скриптам
    main_script = os.path.abspath("main.py")
    desktop_script = os.path.abspath("desktop.py")

    # Запуск скриптов
    main_process = run_script(main_script)
    desktop_process = run_script(desktop_script)

    # Ожидание завершения процесса desktop.py
    desktop_process.wait()

    # Завершение процесса main.py
    main_process.terminate()

    # Дополнительное ожидание для завершения процесса main.py
    time.sleep(1)

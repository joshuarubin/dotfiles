from kittens.tui.handler import result_handler
from kitty.boss import Boss
from typing import List

def main():
    pass


@result_handler(no_ui=True)
def handle_result(args: List[str], answer: str, target_window_id: int, boss: Boss) -> None:
    boss.active_tab.neighboring_window(args[1])

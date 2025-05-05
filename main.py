mport sdf


def sum(a: int, b: int):
    return a + b
def double_sum(a: int, b: int) -> int:
    return sum(a, b) * sum(a, b)
if __name__ == "__main__":
    assert double_sum(3, 4)
    print("hello")

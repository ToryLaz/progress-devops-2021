def main():
    pass


def arr_func(array_r):
    if len(array_r) != 0:
        for i in range(len(array_r)):
            print(i, end=" position is for - ")
            print(array_r[i])
    else:
        print("Can not print an empty array!")


# arr_func([])
arr_func(['red', 'blue', 'green'])

if __name__ == "__main__":
    main()
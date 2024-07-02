import math

def atribute_to_matrix(mat, column):
    number_lines = len(mat)
    number_columns = len(mat[0])
    size = number_lines - 1
    matrix = [0] * size
    i = 0
    while i < size:
        matrix[i] = mat[i + 1][column]
        i += 1

    new_mat = [0] * size
    i = 0
    j = 0
    count = 0
    flag = 0
    while i < size:
        while j < size:
            if matrix[i] == new_mat[j]:
                flag = 1
            j += 1
        if flag == 0:
            new_mat[count] = matrix[i]
            count += 1
        flag = 0
        j = 0
        i += 1

    new_mat_2 = [0] * count
    i = 0
    while i < count:
        new_mat_2[i] = new_mat[i]
        i += 1

    mat_count = [0] * count
    count_2 = 0
    i = 0
    while i < count:
        while j < size:
            if new_mat_2[i] == matrix[j]:
                count_2 += 1
            j += 1
        mat_count[i] = count_2
        j = 0
        count_2 = 0
        i += 1

    return mat_count, count

def entropy(mat, column):
    number_lines = len(mat)
    number_columns = len(mat[0])
    mat_count2 = atribute_to_matrix(mat, column)[0]
    count2 = atribute_to_matrix(mat, column)[1]
    total = number_lines - 1
    entropy_atribute = 0
    i = 0
    while i < count2:
        p = mat_count2[i] / total
        entropy_atribute += p * math.log(p, 2)
        i = i + 1
    return -entropy_atribute

def importance(mat, a, examples):
    number_lines = len(mat)
    number_columns = len(mat[0])
    lines = len(examples)
    columns = len(a)

    new_mat = [[0 for i in range(columns)] for j in range(lines)]
    for i in range(lines):
        for j in range(columns):
            if examples[i] == 1 and a[j] == 1:
                new_mat[i][j] = mat[i][j]

    lines2 = 0
    for i in range(lines):
        if examples[i] == 1:
            lines2 = lines2 + 1

    new_mat_2 = [[0 for i in range(columns)] for j in range(lines2)]
    count_line = 0
    for i in range(lines):
        if examples[i] == 1:
            for j in range(columns):
                new_mat_2[count_line][j] = new_mat[i][j]
            count_line = count_line + 1

    v_entropy = [10]
    for i in range(0, number_columns - 1):
        if a[i] == 1:
            v_entropy.append(entropy(mat, i))
            # print(entropy(mat, i))

    min_place = 0
    min = v_entropy[0]
    for i in range(1, len(v_entropy)):
        if min > v_entropy[i]:
            min = v_entropy[i]
            min_place = i

    return min_place

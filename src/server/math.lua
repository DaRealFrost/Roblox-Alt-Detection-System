local functions = {}

function functions.mean(data)
    if type(data) ~= 'table' then
        error('Data must be a table')
    end

    local sum = 0
    for i = 1, #data do
        sum = sum + data[i]
    end

    return sum / #data
end

function functions.total(data)
    if type(data) ~= 'table' then
        error('Data must be a table')
    end

    local sum = 0
    for i = 1, #data do
        sum = sum + data[i]
    end

    return sum
end

-- Source: https://www.khanacademy.org/math/statistics-probability/summarizing-quantitative-data/variance-standard-deviation-sample/a/population-and-sample-standard-deviation-review
function functions.standardDeviation(data)
    if type(data) ~= 'table' then
        error('Data must be a table')
    end

    local mean = functions.mean(data)
    local sum = 0

    for i = 1, #data do
        sum = sum + ((data[i] - mean) ^ 2)
    end

    sum = sum / (#data - 1)
    return math.sqrt(sum)
end

function functions.min(data)
    if type(data) ~= 'table' then
        error('Data must be a table')
    end

    local min = data[1]
    for i = 2, #data do
        if data[i] < min then
            min = data[i]
        end
    end

    return min
end

function functions.Q1(data)
    if type(data) ~= 'table' then
        error('Data must be a table')
    end

    local sortedData = { table.unpack(data) }
    table.sort(sortedData)
    local pos = math.floor(#sortedData / 4)
    return sortedData[pos]
end

function functions.median(data)
    if type(data) ~= 'table' then
        error('Data must be a table')
    end

    local sortedData = { table.unpack(data) }
    table.sort(sortedData)

    if #sortedData % 2 == 0 then
        local mid1 = sortedData[#sortedData / 2]
        local mid2 = sortedData[#sortedData / 2 + 1]
        return (mid1 + mid2) / 2
    else
        return sortedData[math.ceil(#sortedData / 2)]
    end
end

function functions.Q3(data)
    if type(data) ~= 'table' then
        error('Data must be a table')
    end

    local sortedData = { table.unpack(data) }
    table.sort(sortedData)
    local pos = math.floor(3 * #sortedData / 4)
    return sortedData[pos]
end

function functions.max(data)
    if type(data) ~= 'table' then
        error('Data must be a table')
    end

    local max = data[1]
    for i = 2, #data do
        if data[i] > max then
            max = data[i]
        end
    end

    return max
end

return functions

local functions = {}

function functions.GenerateAccountAgeTable(data)
    if type(data) ~= 'table' then
        error('Data must be a table')
    end

    local AccountAgeTable = {}
    for i = 1, #data do
        local url = string.format('https://account-age.frost-roblox-file-storage.workers.dev/?userId=%s', data[i])

        local response = game:GetService('HttpService'):GetAsync(url)
        local responseData = game:GetService('HttpService'):JSONDecode(response)

        table.insert(AccountAgeTable, responseData['accountAge'])
    end

    return AccountAgeTable
end

return functions

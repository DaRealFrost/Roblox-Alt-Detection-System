local mathModule = require(script.Parent.math)
local functions = {}

function GenerateAccountAgeTable(data)
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

function GenerateBadgeCountTable(data)
    if type(data) ~= 'table' then
        error('Data must be a table')
    end

    local BadgeCountTable = {}
    for i = 1, #data do
        local url = string.format('https://badge-count.frost-roblox-file-storage.workers.dev/?userId=%s', data[i])

        local response = game:GetService('HttpService'):GetAsync(url)
        local responseData = game:GetService('HttpService'):JSONDecode(response)

        table.insert(BadgeCountTable, responseData['badgeCount'])
    end

    return BadgeCountTable
end

function GenerateGroupCountTable(data)
    if type(data) ~= 'table' then
        error('Data must be a table')
    end

    local GroupCountTable = {}
    for i = 1, #data do
        local url = string.format('https://group-count.frost-roblox-file-storage.workers.dev/?userId=%s', data[i])

        local response = game:GetService('HttpService'):GetAsync(url)
        local responseData = game:GetService('HttpService'):JSONDecode(response)

        table.insert(GroupCountTable, responseData['groupCount'])
    end

    return GroupCountTable
end

function GenerateFriendsCountTable(data)
    if type(data) ~= 'table' then
        error('Data must be a table')
    end

    local FriendsCountTable = {}
    for i = 1, #data do
        local url = string.format('https://friends-count.frost-roblox-file-storage.workers.dev/?userId=%s', data[i])

        local response = game:GetService('HttpService'):GetAsync(url)
        local responseData = game:GetService('HttpService'):JSONDecode(response)

        table.insert(FriendsCountTable, responseData['friendsCount'])
    end

    return FriendsCountTable
end

function GenerateFollowingCountTable(data)
    if type(data) ~= 'table' then
        error('Data must be a table')
    end

    local FollowingCountTable = {}
    for i = 1, #data do
        local url = string.format('https://following-count.frost-roblox-file-storage.workers.dev/?userId=%s', data[i])

        local response = game:GetService('HttpService'):GetAsync(url)
        local responseData = game:GetService('HttpService'):JSONDecode(response)

        table.insert(FollowingCountTable, responseData['followingCount'])
    end

    return FollowingCountTable
end

function GenerateFollowersCountTable(data)
    if type(data) ~= 'table' then
        error('Data must be a table')
    end

    local FollowersCountTable = {}
    for i = 1, #data do
        local url = string.format('https://followers-count.frost-roblox-file-storage.workers.dev/?userId=%s', data[i])

        local response = game:GetService('HttpService'):GetAsync(url)
        local responseData = game:GetService('HttpService'):JSONDecode(response)

        table.insert(FollowersCountTable, responseData['followersCount'])
    end

    return FollowersCountTable
end

function functions.GenerateDataSet(data)
    if type(data) ~= 'table' then
        error('Data must be a table')
    end

    local AccountAgeTable = GenerateAccountAgeTable(data)
    local BadgeCountTable = GenerateBadgeCountTable(data)
    local GroupCountTable = GenerateGroupCountTable(data)
    local FriendsCountTable = GenerateFriendsCountTable(data)
    local FollowingCountTable = GenerateFollowingCountTable(data)
    local FollowersCountTable = GenerateFollowersCountTable(data)

    local dataset = {
        accountAge = {
            mean = mathModule.mean(AccountAgeTable),
            total = mathModule.total(AccountAgeTable),
            standardDeviation = mathModule.standardDeviation(AccountAgeTable),
            median = mathModule.median(AccountAgeTable),
            Q1 = mathModule.Q1(AccountAgeTable),
            Q3 = mathModule.Q3(AccountAgeTable),
            max = mathModule.max(AccountAgeTable),
            min = mathModule.min(AccountAgeTable),
        },
        badgeCount = {
            mean = mathModule.mean(BadgeCountTable),
            total = mathModule.total(BadgeCountTable),
            standardDeviation = mathModule.standardDeviation(BadgeCountTable),
            median = mathModule.median(BadgeCountTable),
            Q1 = mathModule.Q1(BadgeCountTable),
            Q3 = mathModule.Q3(BadgeCountTable),
            max = mathModule.max(BadgeCountTable),
            min = mathModule.min(BadgeCountTable),
        },
        groupCount = {
            mean = mathModule.mean(GroupCountTable),
            total = mathModule.total(GroupCountTable),
            standardDeviation = mathModule.standardDeviation(GroupCountTable),
            median = mathModule.median(GroupCountTable),
            Q1 = mathModule.Q1(GroupCountTable),
            Q3 = mathModule.Q3(GroupCountTable),
            max = mathModule.max(GroupCountTable),
            min = mathModule.min(GroupCountTable),
        },
        friendsCount = {
            mean = mathModule.mean(FriendsCountTable),
            total = mathModule.total(FriendsCountTable),
            standardDeviation = mathModule.standardDeviation(FriendsCountTable),
            median = mathModule.median(FriendsCountTable),
            Q1 = mathModule.Q1(FriendsCountTable),
            Q3 = mathModule.Q3(FriendsCountTable),
            max = mathModule.max(FriendsCountTable),
            min = mathModule.min(FriendsCountTable),
        },
        followingCount = {
            mean = mathModule.mean(FollowingCountTable),
            total = mathModule.total(FollowingCountTable),
            standardDeviation = mathModule.standardDeviation(FollowingCountTable),
            median = mathModule.median(FollowingCountTable),
            Q1 = mathModule.Q1(FollowingCountTable),
            Q3 = mathModule.Q3(FollowingCountTable),
            max = mathModule.max(FollowingCountTable),
            min = mathModule.min(FollowingCountTable),
        },
        followersCount = {
            mean = mathModule.mean(FollowersCountTable),
            total = mathModule.total(FollowersCountTable),
            standardDeviation = mathModule.standardDeviation(FollowersCountTable),
            median = mathModule.median(FollowersCountTable),
            Q1 = mathModule.Q1(FollowersCountTable),
            Q3 = mathModule.Q3(FollowersCountTable),
            max = mathModule.max(FollowersCountTable),
            min = mathModule.min(FollowersCountTable),
        },
    }

    return dataset
end

return functions

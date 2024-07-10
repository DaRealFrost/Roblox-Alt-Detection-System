local dataGetterModule = require(script.dataGetter)
local inputAccountsModule = require(script.inputAccounts)
local mathModule = require(script.math)

local AccountAgeTable = dataGetterModule.GenerateAccountAgeTable(inputAccountsModule.real)

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
}

warn(dataset)

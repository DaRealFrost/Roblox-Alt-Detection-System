local dataGetterModule = require(script.dataGetter)
local inputAccountsModule = require(script.inputAccounts)

local genTest = dataGetterModule.GenerateDataSet(inputAccountsModule.alt)
warn(genTest)

local dataset

if require(script.generatedData) then
    dataset = require(script.generatedData)
else
    dataset.real = dataGetterModule.GenerateDataSet(inputAccountsModule.real)
    dataset.alt = dataGetterModule.GenerateDataSet(inputAccountsModule.alt)
end

warn(realAccountDataset)

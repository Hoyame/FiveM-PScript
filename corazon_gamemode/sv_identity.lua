RegisterNetEvent("corazon:saveIdentity")
AddEventHandler("corazon:saveIdentity", function(nameIdentity, lieuIdentity, jourIdentity, moisIdentity, yearIdentity)
    local source = source
    local license = GetPlayerIdentifiers(source)[1]

    local nameIdentity = nameIdentity
    local lieuIdentity = lieuIdentity
    local jourIdentity = jourIdentity
    local moisIdentity = moisIdentity
    local yearIdentity = yearIdentity
    local non = "Non"
 
    MySQL.Async.execute('UPDATE user_characters SET nameIdentity = @nameIdentity WHERE license = @license', {
        ['@nameIdentity'] = nameIdentity,
        ['@license'] = license
	})

    MySQL.Async.execute('UPDATE user_characters SET lieuIdentity = @lieuIdentity WHERE license = @license', {
        ['@lieuIdentity'] = lieuIdentity,
        ['@license'] = license
    })
    
    MySQL.Async.execute('UPDATE user_characters SET jourIdentity = @jourIdentity WHERE license = @license', {
        ['@jourIdentity'] = jourIdentity,
        ['@license'] = license
    })
    
    MySQL.Async.execute('UPDATE user_characters SET moisIdentity = @moisIdentity WHERE license = @license', {
        ['@moisIdentity'] = moisIdentity,
        ['@license'] = license
    })
    
    MySQL.Async.execute('UPDATE user_characters SET yearIdentity = @yearIdentity WHERE license = @license', {
        ['@yearIdentity'] = yearIdentity,
        ['@license'] = license
    })

    --------------------------------

    MySQL.Async.execute('UPDATE user_characters SET armePermis = @armePermis WHERE license = @license', {
        ['@armePermis'] = non,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE user_characters SET voiturePermis = @voiturePermis WHERE license = @license', {
        ['@voiturePermis'] = non,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE user_characters SET motoPermis = @motoPermis WHERE license = @license', {
        ['@motoPermis'] = non,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE user_characters SET camionPermis = @camionPermis WHERE license = @license', {
        ['@camionPermis'] = non,
        ['@license'] = license
    })

end)

RegisterNetEvent("corazon:saveFakeIdentity")
AddEventHandler("corazon:saveFakeIdentity", function(nameIdentity, lieuIdentity, jourIdentity, moisIdentity, yearIdentity, jobIdentity)
    local source = source
    local license = GetPlayerIdentifiers(source)[1]

    local nameIdentity = nameIdentity
    local lieuIdentity = lieuIdentity
    local jourIdentity = jourIdentity
    local moisIdentity = moisIdentity
    local yearIdentity = yearIdentity
    local jobIdentity = jobIdentity
    local non = "Non"

    
    MySQL.Async.execute('UPDATE user_fakecharacters SET nameIdentity = @nameIdentity WHERE license = @license', {
      ['@nameIdentity'] = nameIdentity,
      ['@license'] = license
	  })

    MySQL.Async.execute('UPDATE user_fakecharacters SET lieuIdentity = @lieuIdentity WHERE license = @license', {
      ['@lieuIdentity'] = lieuIdentity,
      ['@license'] = license
    })
    
    MySQL.Async.execute('UPDATE user_fakecharacters SET jourIdentity = @jourIdentity WHERE license = @license', {
      ['@jourIdentity'] = jourIdentity,
      ['@license'] = license
    })
    
    MySQL.Async.execute('UPDATE user_fakecharacters SET moisIdentity = @moisIdentity WHERE license = @license', {
      ['@moisIdentity'] = moisIdentity,
      ['@license'] = license
    })
    
    MySQL.Async.execute('UPDATE user_fakecharacters SET yearIdentity = @yearIdentity WHERE license = @license', {
      ['@yearIdentity'] = yearIdentity,
      ['@license'] = license
    })

    MySQL.Async.execute('UPDATE user_fakecharacters SET jobIdentity = @jobIdentity WHERE license = @license', {
        ['@jobIdentity'] = jobIdentity,
        ['@license'] = license
    })  

    --------------------------------

    MySQL.Async.execute('UPDATE user_fakecharacters SET armePermis = @armePermis WHERE license = @license', {
        ['@armePermis'] = non,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE user_fakecharacters SET voiturePermis = @voiturePermis WHERE license = @license', {
        ['@voiturePermis'] = non,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE user_fakecharacters SET motoPermis = @motoPermis WHERE license = @license', {
        ['@motoPermis'] = non,
        ['@license'] = license
    })

    MySQL.Async.execute('UPDATE user_fakecharacters SET camionPermis = @camionPermis WHERE license = @license', {
        ['@camionPermis'] = non,
        ['@license'] = license
    })

end)
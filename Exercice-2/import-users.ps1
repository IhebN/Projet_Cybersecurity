Import-Module ActiveDirectory

$csv = Import-Csv ".\users.csv"

$defaultPassword = ConvertTo-SecureString "Azerty_2025!" -AsPlainText -Force

# Liste des groupes possibles
$groups = @(
  "Animation","AS","ASH","Médical","Hébergement",
  "Cadres","Administratif","Technique",
  "Comptable","Directeur","Médecin","Psychologue",
  "Secrétaire","IDE","cadre de santé"
)

# Création des groupes s'ils n'existent pas
foreach ($g in $groups) {
    if (-not (Get-ADGroup -Filter "Name -eq '$g'" -ErrorAction SilentlyContinue)) {
        New-ADGroup -Name $g -GroupScope Global -GroupCategory Security
    }
}

# Création des utilisateurs
foreach ($u in $csv) {

    $username = ($u.prenom.Substring(0,1) + $u.nom).ToLower()

    New-ADUser `
      -Name "$($u.prenom) $($u.nom)" `
      -GivenName $u.prenom `
      -Surname $u.nom `
      -SamAccountName $username `
      -UserPrincipalName "$username@laplateforme.io" `
      -AccountPassword $defaultPassword `
      -Enabled $true `
      -ChangePasswordAtLogon $true

    # Ajout aux groupes
    $groupsUser = @(
      $u.groupe1,$u.groupe2,$u.groupe3,
      $u.groupe4,$u.groupe5,$u.groupe6
    )

    foreach ($g in $groupsUser) {
        if ($g -ne "" -and $g -ne $null) {
            Add-ADGroupMember -Identity $g -Members $username
        }
    }
}

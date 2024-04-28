<?php
//l'api est divisier en 2 parties la partie fonction, et la partie switch pour les method 
//--------------------------------------------------nécessaire test de l'api------------------------------------------------------------------------------
// $_SERVER['REQUEST_METHOD'] = 'GET';
// $_GET['id'] = 2;

// $_SERVER['REQUEST_METHOD'] = 'POST';
// $_POST['name'] = 'couscous';
// $_POST['origine'] = 'algérie';
// $_POST['difficulter'] = "3";
// $_POST['description'] =  "Le couscous (en berbère : ⵙⴽⵙⵓ seksu ou ⴽⵙⴽⵙⵓ keskesu1, en arabe maghrébin : الطعام، كسكسي، كسكس، سكسو, seksu, kuskus, kusksi, kesksu, t’am) est d'une part une semoule de blé dur préparée à l'huile d'olive (un des aliments de base traditionnel de la cuisine des pays du Maghreb) et d'autre part, une spécialité culinaire issue de la cuisine berbère, à base de couscous, de légumes, d'épices, d'huile d'olive et de viande (rouge ou de volaille) ou de poisson.Il est, avec le tajine, l'un des plats emblématiques de la cuisine traditionnelle du Maghreb et, plus largement, des cuisines juives d'Afrique du Nord, de la cuisine africaine et du régime méditerranéen, cuisiné selon de multiples déclinaisons régionales et culturelles locales. Les plus anciennes traces connues de couscoussiers sont retrouvées dans des sépultures du IIIe siècle av. J.-C., de l'époque du roi berbère Massinissa de Numidie (dans l'actuel nord de l'Algérie)2, un des berceaux de la culture du blé. Connu en France depuis le XVIe siècle, il est intégré dans la cuisine française au début du XXe siècle, via l'Empire colonial français et les pieds-noirs d'Algérie.Les savoirs, savoir-faire et pratiques liés à la production et à la consommation du couscous sont inscrits sur la liste représentative du patrimoine culturel immatériel de l’humanité.";
//--------------------------------------------------------------------------------------------------------------------------------------------------------


$pdo = new PDO('mysql:host=localhost;dbname=recette_api','root','root');
//--------------------------------------------------------------------------------------------------------------------------------------------------------
//methode classique PDO pour poster les functions
function postRecette($name,$origine,$difficulter,$description){
$sql = 'INSERT INTO recettes(recette_name,recette_origine,recette_difficulter,recette_decription) VALUES (:name,:origine,:difficulter,:description)';
global $pdo;
$resquest = $pdo->prepare($sql);
$resquest->bindParam(':name',$name);
$resquest->bindParam(':origine',$origine);
$resquest->bindParam(':difficulter',$difficulter);
$resquest->bindParam(':description',$description);
$resquest->execute();
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------
//methode classique PDO pour get les functions
function getRecette($id){
global $pdo;
if(is_numeric($id)){
$sql = 'SELECT * FROM recettes WHERE id = :id';
$resquest = $pdo->prepare($sql);
$resquest->bindParam(':id', $id);
} else {
    $sql = 'SELECT * FROM recettes' ;
    $resquest = $pdo->prepare($sql);
}
$resquest->execute();
$recettes = array();
while($recette = $resquest->fetch(PDO::FETCH_ASSOC)){
$recettes[] = $recette;
}
return $recettes;
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------
//le case poste verifie tout les inputs fournie par le client et qui sont conforme à la demande et à la base de donner.
switch($_SERVER['REQUEST_METHOD']){
case 'POST': 
    //tout les caratère doivent etre remplit
if(!empty($_POST['name']) && !empty($_POST['origine']) && !empty($_POST['difficulter']) && !empty($_POST['description'])){
//name doit etre conforme (name = titre de la recette) 
if(!is_string($_POST['name']) || strlen($_POST['name']) > 50){
$response = [
'success' => false,
'description' => 'name doit etre une chaine de moin de 50 caractère.'
];
//origine doit etre conforme
}elseif(!is_string($_POST['origine']) || strlen($_POST['origine']) > 50){
    $response = [
    'success' => false,
    'description' => 'origine doit etre une chaine de moin de 50 caractère.'
    ];  
} 
//description doit etre conforme je me suis basser sur le nombre d'oclet demander (ne doit pas depasser 60000 oclet et un caractere normal est egale à 8 oclet) j'ai simplement fait 60000/8 = 8571
elseif(!is_string($_POST['description']) || strlen($_POST['description']) > 8571){
    $response = [
    'success' => false,
    'description' => 'description doit etre une chaine de moins de 600000 caractère.'
    ]; 
}
else {
//le numéro represetant la dificuter doit etre un numero comprit entre 0 et 5 
if(is_numeric($_POST['difficulter']) && ($_POST['difficulter'] >= 0 && $_POST['difficulter'] <= 5)){
postRecette($_POST['name'],$_POST['origine'],$_POST['difficulter'],$_POST['description']);
    $response = [
        'success' => true,
        'description' => 'votre recette à bien été enregister' ,
        ];
} else{
$response = [
    'success' => false,
    'description' => 'la difficulter doit etre un nombre compris entre 0 et 5.'
];  
}
}
} else {
$response = [
'success' => false,
'description' => 'veuiller remplir correctement le nom,l\'origine, la description, et la difficulter'
];
}    
break;
//--------------------------------------------------------------------------------------------------------------------------------------------------------
//permet simplement d'afficher les caractère
case 'GET': 
if(!empty($_GET['id'])){
$recettes = getRecette($_GET['id']);
} else {
$recettes = getRecette(null);
}
$response = [
'success' => true,
'despcription' => $recettes
];
break;
//--------------------------------------------------------------------------------------------------------------------------------------------------------
default :  header("HTTP/1.0 405 Method Not Allowed");
}
if(!empty($response)){
header('content-type: application/json');
echo json_encode($response);
}

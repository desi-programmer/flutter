<?php
 header("Access-Control-Allow-Origin: *");
 header("Content-Type: application/json");
 header("Accept: application/json");

 $method = $_SERVER['REQUEST_METHOD'];

//  $response = array(
//     'status' => $method,
// );
// echo json_encode($response);

require 'db.php';

switch ($method) {
    case 'GET':
        # code...
        $sql = "SELECT * FROM notes";
        $result = mysqli_query($conn, $sql);
        $tasks = array();
        if(mysqli_num_rows($result) > 0){

            while($row = mysqli_fetch_assoc($result)){
                array_push($tasks, $row);
            }

            $response = array(
                'status' => true,
                'msg' => "Fetched Successfully",
                'data' => $tasks,
            );
            echo json_encode($response);


        }else{
            $response = array(
                'status' => false,
                'msg' => "No Tasks Found",
            );
            echo json_encode($response);
        }
        break;
    case 'POST':
        // create a note
        $data = json_decode(file_get_contents('php://input'));


        if(is_null($data)){
            $response = array(
                'status' => false,
                'msg' => "Empty Fields",
            );
            header("HTTP/1.1 400");
            echo json_encode($response);
        }else{
            $sql = "INSERT INTO notes (note) VALUES (?)";
            if($stmt = mysqli_prepare($conn, $sql)){
                mysqli_stmt_bind_param($stmt, "s", $data->note);
                mysqli_stmt_execute($stmt);
                $response = array(
                    'status' => true,
                    'msg' => "Added Successfully"
                );
                header("HTTP/1.1 200 OK");
                echo json_encode($response);
            }else{
                $response = array(
                    'status' => false,
                    'msg' => "Error Preparing Statements"
                );
                header("HTTP/1.1 500");
                echo json_encode($response);
            }
        }
        # code...
        break;
    case 'PUT':
        # update a note
        $data = json_decode(file_get_contents("php://input"));

        if (is_null($data)) {
            $response = array(
                'status' => false,
                'msg' => "Empty Fields"
            );
            echo json_encode($response);
        }else{
            $sql = "UPDATE notes SET note = ? WHERE id = ?";
            if ($stmt = mysqli_prepare($conn, $sql)) {

                mysqli_stmt_bind_param($stmt, "ss", $data->note, $data->id);
                mysqli_stmt_execute($stmt);
                $response = array(
                    'status' => true,
                    'msg' => "Updated Successfully"
                );
                header("HTTP/1.1 200 OK");
                echo json_encode($response);

            }else{
                $response = array(
                    'status' => false,
                    'msg' => "Error Preparing Statements"
                );
                echo json_encode($response);
            }
        }


        break;
    case 'DELETE':
        # delete a note of the given id
        $data = json_decode(file_get_contents('php://input'));

        if(is_null($data)){
            $response = array(
                'status' => false,
                'msg' => "Empty Fields",
            );
            header("HTTP/1.1 400");
            echo json_encode($response);
        }else{

         $sql = "DELETE FROM notes WHERE id = " .$data->id; 
         $result = mysqli_query($conn, $sql);
         $response = array(
            'status' => true,
            'msg' => "Deleted Successfully"
        );
        echo json_encode($response);

        }

        break;
    
    default:
    $response = array(
        'status' => false,
        'msg' => "Unexpected Request"
    );
    echo json_encode($response);
    break;
}



    // switch req_method
    //      - GET - > all notes 
    //     - POST  -> create 
    //     - PUT  -> update
    //     - DELETE -> delete

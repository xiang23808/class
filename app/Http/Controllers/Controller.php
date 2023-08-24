<?php

namespace App\Http\Controllers;

use App\Helpers\ApiResponse;
use App\Helpers\ResponseEnum;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests, ApiResponse;

    protected function checkPassword(Model $user,Request $request)
    {
        if (!\Hash::check($request->password, $user->password)) {
            $this->failed(ResponseEnum::SERVICE_LOGIN_ACCOUNT_ERROR);
        }
    }

    protected function getToken(Model $user)
    {
        return $user->createToken($user->name)->accessToken;
    }

    protected function dataFormat($data)
    {
        return [
            'list' => $data->items() ?? new \stdClass(),
            'pagination' => [
                'total_num' => $data->total(),
                'current_page' => $data->currentPage(),
                'page_size' => $data->perPage(),
                'last_page' => $data->lastPage(),
            ]
        ];
    }
}

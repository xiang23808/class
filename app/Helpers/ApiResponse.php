<?php

namespace App\Helpers;

use App\Exceptions\ApiException;

trait ApiResponse
{
    public function failed($codeResponse = ResponseEnum::HTTP_ERROR)
    {
        [$code, $message] = $codeResponse;
        throw new ApiException($message, $code);
    }

    /**
     * @param $message
     * @param string $status
     * @return mixed
     */
    public function message($codeResponse = ResponseEnum::HTTP_OK)
    {
        [$code, $message] = $codeResponse;
        return $this->response($code, $message);
    }

    /**
     * @param $data
     * @param string $status
     * @return mixed
     */
    public function success($data, $codeResponse = ResponseEnum::HTTP_OK)
    {
        [$code, $message] = $codeResponse;
        return $this->response($code, $message, $data);
    }


    public function response($code, $message, $data = '')
    {
        return response()->json([
            'code' => $code,
            'message' => $message,
            "data" => $data ?: json_encode(new \stdClass),
        ]);
    }
}

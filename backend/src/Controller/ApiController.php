<?php
// src/Controller/ApiController.php
namespace App\Controller;

use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

class ApiController
{
    #[Route('/api/endpoint', name: 'api_endpoint')]
    public function index(): JsonResponse
    {
        return new JsonResponse(['message' => 'Działa!']);
    }
}

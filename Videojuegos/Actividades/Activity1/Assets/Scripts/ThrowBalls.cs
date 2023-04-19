/*
Create copies of a ball object to fall on the game screen
Pablo Bolio
*/

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ThrowBalls : MonoBehaviour
{
    [SerializeField] GameObject ball;
    [SerializeField] float delay;
    [SerializeField] float limit;
    // Start is called before the first frame update
    void Start()
    {
        // Call the specified function at regular intervals
        InvokeRepeating("CreateBall", delay, delay);
    }
    void CreateBall(){
        // Generate a random position in X and over thr view of the camera
        Vector3 new_pos = new Vector3(Random.Range(-limit, limit), 3.86f, 0);
        Instantiate(ball, new_pos, Quaternion.identity);
    }
}

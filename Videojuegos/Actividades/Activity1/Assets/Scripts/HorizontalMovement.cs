using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HorizontalMovement : MonoBehaviour
{
    Vector3 move;
    [SerializeField] float speed;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
       move.x = Input.GetAxisRaw("Horizontal");
       transform.Translate(move* speed * Time.deltaTime); 
    }
}

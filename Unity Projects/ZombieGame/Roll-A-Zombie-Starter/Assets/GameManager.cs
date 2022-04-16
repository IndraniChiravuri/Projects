using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GameManager : MonoBehaviour
{
    // Start is called before the first frame update
    private int selectedZombiePosition = 0;
    private int score = 0;

    public Text scoreText;
    public GameObject selectedZombie;
    public List<GameObject> zombies;
    public Vector3 selectedSize;
    public Vector3 defaultSize;

    // Start is called before the first frame update
    void Start()
    {
        SelectZombie(selectedZombie);
        scoreText.text = "Score: " + score;
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKeyDown("left"))
        {
            GetZombieLeft();
        }

        if(Input.GetKeyDown("right"))
        {
            GetZombieRight();
        }

        if(Input.GetKeyDown("up"))
        {
            MoveUp();
        }

        if(Input.GetKeyDown("down"))
        {
            MoveDown();
        }
    }

    void GetZombieLeft()
    {
        if(selectedZombiePosition == 0)
        {
            selectedZombiePosition = 3;  
            SelectZombie(zombies[3]);
        }
        else
        {
            selectedZombiePosition = selectedZombiePosition - 1;
            SelectZombie(zombies[selectedZombiePosition]);
        }
    }

    void GetZombieRight()
    {
        if (selectedZombiePosition == 3)
        {
            selectedZombiePosition = 0;
            SelectZombie(zombies[0]);
        }
        else
        {
            selectedZombiePosition = selectedZombiePosition + 1;
            SelectZombie(zombies[selectedZombiePosition]);
        }
    }

    void MoveUp() {

        Rigidbody rb = selectedZombie.GetComponent<Rigidbody>();
        rb.AddForce(0, 0, 10, ForceMode.Impulse);
    }

    private void MoveDown()
    {
        Rigidbody rb = selectedZombie.GetComponent<Rigidbody>();
        rb.AddForce(0, 0, -10, ForceMode.Impulse);
    }

    void SelectZombie(GameObject newZombie)
    {
        UnSelectZombie();
        selectedZombie = newZombie; 
        newZombie.transform.localScale = selectedSize;
        
    }

    void UnSelectZombie( )
    {
        selectedZombie.transform.localScale = defaultSize;
    }

    public void AddPoint()
    {
        score = score + 1;
        scoreText.text = "Score : " + score;
    }
}

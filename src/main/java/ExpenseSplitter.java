import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;

class Activity {
    private String email;
    private List<String> participants;
    private BigDecimal totalAmount;
    private String activityName;

    public Activity(String email, List<String> participants, BigDecimal totalAmount, String activityName) {
        this.email = email;
        this.participants = new ArrayList<>(participants);  // Sử dụng ArrayList để có thể sửa đổi
        this.totalAmount = totalAmount;
        this.activityName = activityName;
    }

    public List<String> getParticipants() {
        return participants;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public String getActivityName() {
        return activityName;
    }

    public String getEmail() {
        return email;
    }
}

public class ExpenseSplitter {

    public static Map<String, BigDecimal> calculateTotalAverageExpensePerPerson(List<Activity> activities) {
        Map<String, BigDecimal> totalExpenses = new HashMap<>();

        for (Activity activity : activities) {
            BigDecimal amountPerPerson = activity.getTotalAmount().divide(new BigDecimal(activity.getParticipants().size()), 0, RoundingMode.HALF_UP);

            for (String participant : activity.getParticipants()) {
                totalExpenses.put(participant, totalExpenses.getOrDefault(participant, BigDecimal.ZERO).add(amountPerPerson));
            }
        }

        return totalExpenses;
    }

    public static Map<String, BigDecimal> calculateTotalPayments(List<Activity> activities) {
        Map<String, BigDecimal> totalPayments = new HashMap<>();

        for (Activity activity : activities) {
            String payerEmail = activity.getEmail();
            BigDecimal totalAmount = activity.getTotalAmount();  // Chuyển totalAmount sang BigDecimal và làm tròn

            BigDecimal currentPayment = totalPayments.getOrDefault(payerEmail, BigDecimal.ZERO);

            BigDecimal updatedPayment = currentPayment.add(totalAmount);

            totalPayments.put(payerEmail, updatedPayment);
        }

        return totalPayments;
    }


    public static void calculatePayments(List<Activity> activities, Map<String, BigDecimal> totalExpenses, Map<String, BigDecimal> totalPayments) {
        Map<String, BigDecimal> mapA = new HashMap<>();
        Map<String, BigDecimal> mapB = new HashMap<>();

        for (String participant : totalExpenses.keySet()) {
            BigDecimal averageExpense = totalExpenses.get(participant);
            BigDecimal totalPaid = totalPayments.getOrDefault(participant, BigDecimal.ZERO);

            if (totalPaid.compareTo(averageExpense) > 0) {
                mapA.put(participant, totalPaid.subtract(averageExpense));
            } else {
                mapB.put(participant, averageExpense.subtract(totalPaid));
            }
        }

        List<Map.Entry<String, BigDecimal>> mapAList = new ArrayList<>(mapA.entrySet());
        mapAList.sort((entry1, entry2) -> entry2.getValue().compareTo(entry1.getValue()));

        List<Map.Entry<String, BigDecimal>> mapBList = new ArrayList<>(mapB.entrySet());
        mapBList.sort((entry1, entry2) -> entry2.getValue().compareTo(entry1.getValue()));

        System.out.println("Initial mapAList: " + mapAList);
        System.out.println("Initial mapBList: " + mapBList);

        while (!mapAList.isEmpty() && !mapBList.isEmpty()) {
            Map.Entry<String, BigDecimal> aEntry = mapAList.get(0);
            Map.Entry<String, BigDecimal> bEntry = mapBList.get(0);

            BigDecimal minAmount = aEntry.getValue().min(bEntry.getValue());
            System.out.println(bEntry.getKey() + " pays " + minAmount + " to " + aEntry.getKey());

            aEntry.setValue(aEntry.getValue().subtract(minAmount));
            bEntry.setValue(bEntry.getValue().subtract(minAmount));

            // In ra trạng thái sau khi cập nhật giá trị
            System.out.println("Updated aEntry: " + aEntry);
            System.out.println("Updated bEntry: " + bEntry);

            if (aEntry.getValue().compareTo(BigDecimal.ZERO) == 0) {
                mapAList.remove(aEntry);
            }
            if (bEntry.getValue().compareTo(BigDecimal.ZERO) == 0) {
                mapBList.remove(bEntry);
            }

            // In lại danh sách sau mỗi lần xóa
            System.out.println("mapAList after removal: " + mapAList);
            System.out.println("mapBList after removal: " + mapBList);
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        Activity activity1 = new Activity("hiệu", List.of("hiệu", "ánh", "ly", "hiền", "huyền", "thịnh"), BigDecimal.valueOf(1230000), "chơi");
        Activity activity2 = new Activity("ánh", List.of("hiệu", "ánh", "ly", "hiền", "huyền", "thịnh"), BigDecimal.valueOf(6000000), "ăn");
        Activity activity3 = new Activity("ly", List.of("hiệu", "ánh", "ly", "hiền", "huyền", "thịnh"), BigDecimal.valueOf(1300000), "xemphim");

        List<Activity> activities = new ArrayList<>();
        activities = List.of(activity1, activity2, activity3);


//        while (true) {
//            System.out.println("\nEnter details for an activity:");
//
//            System.out.print("Enter email of the person paying: ");
//            String email = scanner.nextLine();
//
//            System.out.print("Enter participants (comma separated emails): ");
//            String participantsInput = scanner.nextLine();
//            List<String> participants = new ArrayList<>(Arrays.asList(participantsInput.split(","))); // Chuyển đổi sang ArrayList
//
//            System.out.print("Enter total amount spent: ");
//            double totalAmount = scanner.nextDouble();
//            scanner.nextLine();
//
//            System.out.print("Enter activity name: ");
//            String activityName = scanner.nextLine();
//
//            activities.add(new Activity(email, participants, totalAmount, activityName));
//
//            System.out.print("Do you want to add another activity? (yes/no): ");
//            String response = scanner.nextLine();
//
//            if (response.equalsIgnoreCase("no")) {
//                break;
//            }
//        }

        Map<String, BigDecimal> totalExpenses = calculateTotalAverageExpensePerPerson(activities);
        Map<String, BigDecimal> totalPayments = calculateTotalPayments(activities);

        calculatePayments(activities, totalExpenses, totalPayments);

        scanner.close();
    }
}
